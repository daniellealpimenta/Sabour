//
//  GlobalAppState.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 29/05/25.
//

import SwiftUI

class GlobalAppState: ObservableObject {
    
    private let jogosConcluidosKey = "appGlobalState_jogosConcluidos_persistente"

    @Published var jogosConcluidosPorCultura: [String: Int] {
        didSet {
            UserDefaults.standard.set(jogosConcluidosPorCultura, forKey: jogosConcluidosKey)
        }
    }

    @Published var culturaAtual: String = " "
    
    init() {

        if let savedData = UserDefaults.standard.dictionary(forKey: jogosConcluidosKey) as? [String: Int] {
            self.jogosConcluidosPorCultura = savedData
        } else {
            self.jogosConcluidosPorCultura = [:]
        }
    }
    
    func incrementarJogosConcluidos(paraCultura cultura: String? = nil) {
        let culturaAlvo = cultura ?? self.culturaAtual
        if culturaAlvo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || culturaAlvo == " " {
            return
        }
        
        var tempJogos = jogosConcluidosPorCultura
        tempJogos[culturaAlvo, default: 0] += 1
        jogosConcluidosPorCultura = tempJogos
    }
    
    func definirCulturaAtual(novaCultura: String) {
        self.culturaAtual = novaCultura
        
        if jogosConcluidosPorCultura[novaCultura] == nil {
            var tempJogos = jogosConcluidosPorCultura
            tempJogos[novaCultura] = 0
            jogosConcluidosPorCultura = tempJogos
        }
    }
    
    func getJogosConcluidos(paraCultura cultura: String) -> Int {
        return jogosConcluidosPorCultura[cultura, default: 0]
    }

    func resetarProgressoJogos() {
        jogosConcluidosPorCultura = [:]
    }
}
