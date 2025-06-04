//
//  AnalysisView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 20/05/25.
//

import SwiftUI

struct AnalysisView: View {
    let recipe: Recipe
    
    @State private var navigateToHomeFromAnalysis: Bool = false
    
    @State var result: Int = 0
    @EnvironmentObject var gameTimerManager: GameTimerManager
    @EnvironmentObject var globalAppState: GlobalAppState
    @State private var formattedGameDuration: String = "0:00"
    
    let selectedIngredients: [UUID]
    let selectedPreparations: [UUID]
    
    var message: Messages {
        if result == 100 {
            return Messages.perfectMessages.randomElement()!
        } else if result >= 80 && result < 100 {
            return Messages.goodMessages.randomElement()!
        } else if result >= 40 && result < 80 {
            return Messages.mediumMessages.randomElement()!
        } else {
            return Messages.badMessages.randomElement()!
        }
    }
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                
                ImageRecipeView(recipe: recipe).padding(.top, 100)
                
                Spacer()
                
                VStack(alignment: .center){
                    Text(message.title)
                        .font(Font.custom("Bodoni 72", size: 40).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Good"))
                    
                    Text(message.message)
                        .font(Font.custom("Quicksand", size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Color2"))
                }
                
                HStack {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 130, height: 41)
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .inset(by: 1)
                                    .stroke(Color("Color2"), lineWidth: 2)
                            )
                        
                        HStack{
                            Image(systemName: "checkmark.circle").imageScale(.large)
                            Text("\(result)%").font(Font.custom("Quicksand", size: 25).weight(.bold))
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 130, height: 41)
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .inset(by: 1)
                                    .stroke(Color("Color2"), lineWidth: 2)
                            )
                        
                        HStack{
                            Image(systemName: "stopwatch").imageScale(.large)
                            Text(formattedGameDuration).font(Font.custom("Quicksand", size: 25).weight(.bold))
                        }
                    }
                }
                
                Button(action: {
                    SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                    showSheet.toggle()
                }) {
                    Image("Botao4")
                }
                
                Spacer()
                
                Button(action: {
                    SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                    
                    self.navigateToHomeFromAnalysis = true
                }) {
                    Image("Botao6")
                }
                .padding(.bottom, 40)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("background").resizable().scaledToFill())
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSheet, content: {
          AnalysisRecomendationView(recipe: recipe, selectedIngredients: selectedIngredients, selectedPreparations: selectedPreparations)
        })
        .foregroundStyle(Color("Color2"))
        .onAppear {
            SoundManager.instance.stopBackgroundMusicWithFade()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                SoundManager.instance.playSoundEffect(soundFileName: "bell", volume: 0.2)
            }
            gameTimerManager.stopTimer()
            formattedGameDuration = gameTimerManager.getFormattedFinalDuration()
            result = recipe.calcularAcerto(
                selectedIngredients: Set(selectedIngredients),
                selectedPreparationMethods: Set(selectedPreparations)
            )
                }
        .onDisappear() {
            globalAppState.incrementarJogosConcluidos()
        }.navigationDestination(isPresented: $navigateToHomeFromAnalysis) {
            Home() // A view de destino
        }

    }
}

//#Preview {
//    AnalysisView()
//}
