//
//  GameTimerManager.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import Foundation
import Combine

class GameTimerManager: ObservableObject {
    @Published var startTime: Date?
    @Published var isRunning: Bool = false
    @Published var finalDuration: TimeInterval?

    func startTimer() {
        startTime = Date()
        isRunning = true
        finalDuration = nil
    }

    func stopTimer() {
        guard let startTime = startTime, isRunning else {
            if !isRunning && self.startTime != nil {
            } else {
                self.finalDuration = 0
            }
            return
        }

        let endTime = Date()
        let duration = endTime.timeIntervalSince(startTime)
        self.finalDuration = duration
        isRunning = false
        
    }

    func getFormattedFinalDuration() -> String {
        guard let duration = finalDuration else { return "0:00" }
        return formatTimeInterval(duration)
    }

    private func formatTimeInterval(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? "0:00"
    }
}
