//
//  Book.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 13/05/25.
//

import Foundation
import SwiftUI
import Combine

class Book: ObservableObject {
    @Published var currentIndex = 0
    let livros = (0...32).map { "Livro\($0)" }
    
    private var timerCancellable: AnyCancellable?
    
    func voltarPagina(backIndex: Int){
        timerCancellable = Timer.publish(every: 0.07, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if currentIndex > backIndex {
                    self.currentIndex = (self.currentIndex - 1) % self.livros.count
                }
                
            }
    }
    
    func passarPagina(destinationIndex: Int) {
        timerCancellable = Timer.publish(every: 0.07, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if currentIndex < destinationIndex {
                    self.currentIndex = (self.currentIndex + 1) % self.livros.count
                }
                
            }
    }
        
}


