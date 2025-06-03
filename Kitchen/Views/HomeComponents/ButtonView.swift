//
//  ButtonView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 14/05/25.
//
 
import SwiftUI

struct ButtonView: View {
    let name: String
    @State private var showGameView: Bool = false
    
    @Binding var showingButton: Bool
    
    var body: some View {
        
        switch name {
        case "Cozinhar":
                        Button(action: {
                            SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                        
                            self.showGameView = true
                        }) {
                            Image("Botao0")
                        }.navigationDestination(isPresented: $showGameView) {
                            GameView()
                        }
        case "CozinharDesativado":
            Button(action: {
                SoundManager.instance.playSoundEffect(soundFileName: "locked", volume: 0.7)
                showingButton.toggle()
            }){
                            Image("Botao1")
                        }
            default:
                Text("Button")
        }
    }
}

//#Preview {
//    ButtonView(name: "", showingButton: false)
//}


