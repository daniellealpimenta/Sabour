//
//  SoundManager.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 02/06/25.
//

import Foundation
import AVFoundation

class SoundManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    static let instance = SoundManager()

    var backgroundMusicPlayer: AVAudioPlayer?
    private var soundEffectPlayers: [AVAudioPlayer] = []

    private var fadeOutTimer: Timer?
    private weak var playerBeingFadedOut: AVAudioPlayer?

    private override init() {
        super.init()
        configureAudioSession()
    }

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("❌ Falha ao configurar AVAudioSession: \(error.localizedDescription)")
        }
    }

    // MARK: - Background Music Methods

    func playBackgroundMusic(soundFileName: String, fileType: String = "mp3", volume: Float = 0.5) {
        fadeOutTimer?.invalidate()
        fadeOutTimer = nil
        playerBeingFadedOut = nil
        backgroundMusicPlayer?.stop()

        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: fileType) else {
            print("🔇 Música de fundo não encontrada: \(soundFileName).\(fileType)")
            return
        }

        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.numberOfLoops = -1
            backgroundMusicPlayer?.volume = min(max(volume, 0.0), 1.0)
            backgroundMusicPlayer?.prepareToPlay()
            backgroundMusicPlayer?.play()
        } catch {
            print("❌ Erro ao tocar música de fundo \(soundFileName).\(fileType): \(error.localizedDescription)")
            backgroundMusicPlayer = nil
        }
    }

    func stopBackgroundMusicWithFade(duration: TimeInterval = 1.0) {
        fadeOutTimer?.invalidate()
        playerBeingFadedOut = nil

        guard let playerToFade = self.backgroundMusicPlayer, playerToFade.isPlaying else {
            backgroundMusicPlayer?.stop()
            backgroundMusicPlayer = nil
            return
        }
        if playerToFade.volume <= 0.01 {
            playerToFade.stop()
            self.backgroundMusicPlayer = nil
            return
        }
        
        self.playerBeingFadedOut = playerToFade
        let initialVolume = playerToFade.volume
        let fadeSteps = 30
        let interval = max(0.01, duration / Double(fadeSteps))
        var currentStep = 0

        fadeOutTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self, weak capturedBGPlayer = playerToFade] timer in
            guard let self = self, let strongCapturedBGPlayer = capturedBGPlayer, strongCapturedBGPlayer.isPlaying else {
                timer.invalidate()
                if self?.playerBeingFadedOut === capturedBGPlayer { self?.playerBeingFadedOut = nil }
                return
            }
            currentStep += 1
            let progress = Float(currentStep) / Float(fadeSteps)
            let newVolume = initialVolume * (1.0 - progress)
            strongCapturedBGPlayer.volume = max(0.0, newVolume)

            if strongCapturedBGPlayer.volume <= 0.01 || currentStep >= fadeSteps {
                timer.invalidate()
                strongCapturedBGPlayer.stop()
                if self.backgroundMusicPlayer === strongCapturedBGPlayer { self.backgroundMusicPlayer = nil }
                self.playerBeingFadedOut = nil
            }
        }
    }

    func stopBackgroundMusicNow() {
        fadeOutTimer?.invalidate()
        fadeOutTimer = nil
        playerBeingFadedOut = nil
        backgroundMusicPlayer?.stop()
        backgroundMusicPlayer = nil
    }

    func setBackgroundMusicVolume(to value: Float) {
        let clampedVolume = min(max(value, 0.0), 1.0)
        if let player = backgroundMusicPlayer {
            player.volume = clampedVolume
        }
    }

    func isBackgroundMusicPlaying() -> Bool {
        return backgroundMusicPlayer?.isPlaying ?? false
    }

    // MARK: - Sound Effect Methods

    func playSoundEffect(soundFileName: String, fileType: String = "mp3", volume: Float = 1.0) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: fileType) else {
            print("🔇 Efeito sonoro não encontrado: \(soundFileName).\(fileType)")
            return
        }

        do {
            let effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayer.delegate = self
            effectPlayer.volume = min(max(volume, 0.0), 1.0)
            effectPlayer.numberOfLoops = 0
            effectPlayer.prepareToPlay()
            effectPlayer.play()
            soundEffectPlayers.append(effectPlayer)
        } catch {
            print("❌ Erro ao tocar efeito sonoro \(soundFileName).\(fileType): \(error.localizedDescription)")
        }
    }

    // MARK: - AVAudioPlayerDelegate Methods

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        soundEffectPlayers.removeAll { $0 === player }
    }

    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("❌ Erro de decodificação no player: \(player.url?.lastPathComponent ?? "desconhecido"), Erro: \(error?.localizedDescription ?? "N/A")")
        soundEffectPlayers.removeAll { $0 === player }
    }
}
