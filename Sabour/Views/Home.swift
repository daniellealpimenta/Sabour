//
//  Home.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 13/05/25.
//

import SwiftUI

struct Home: View {
    @StateObject private var book = Book()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @EnvironmentObject var globalAppState: GlobalAppState
    
    @State var showingOnboarding: Bool = false
    @State private var shouldNavigateToFavorites: Bool = false

    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .topTrailing) {
                VStack{
                    Text("Selecione a sua cultura gastronômica")
                        .font(Font.custom("Bodoni 72", size: 24).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Color2"))
                        .frame(width: 295, height: 58, alignment: .center)
                    
                    BookView(book: book).padding(.vertical, 30).zIndex(1)
                    
                    if (book.currentIndex == 11){
                        ButtonView(name: "Cozinhar", showingButton: $showingOnboarding)
                    }else if (0...11).contains(book.currentIndex){
                        
                    }else if ((11...18).contains(book.currentIndex) && globalAppState.jogosConcluidosPorCultura["Japan"] ?? 0 >= 2){
                        ButtonView(name: "Cozinhar", showingButton: $showingOnboarding)
                    }else if ((18...25).contains(book.currentIndex) && globalAppState.jogosConcluidosPorCultura["France"] ?? 0 >= 2){
                        ButtonView(name: "Cozinhar", showingButton: $showingOnboarding)
                    }else if ((25...32).contains(book.currentIndex) && globalAppState.jogosConcluidosPorCultura["Mexico"] ?? 0 >= 2){
                        ButtonView(name: "Cozinhar", showingButton: $showingOnboarding)
                    }
                    else {
                        ButtonView(name: "CozinharDesativado", showingButton: $showingOnboarding)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("background").resizable().scaledToFill())
                .sheet(isPresented: .constant(!hasSeenOnboarding)) {
                    OnBoardingView(showOnboarding: Binding(
                        get: { !hasSeenOnboarding },
                        set: { hasSeenOnboarding = !$0 }
                    ))
                }
                .scrollBounceBehavior(.basedOnSize)
                
                HStack{
                    Button(action:{
                        SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                        self.shouldNavigateToFavorites = true
                    }){
                        Image("Botao9")
                    }.padding(.leading, 30)
                    
                    Spacer()
                    
                    Button(action:{hasSeenOnboarding = false}){
                        Image(systemName: "info.circle").foregroundColor(.black).imageScale(.large)
                    }.padding(.trailing, 30)
                }.padding(.top, 50)
                                
            }.edgesIgnoringSafeArea(.all)
            .navigationDestination(isPresented: $shouldNavigateToFavorites) {
                FavoritesListView()
            }

        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                SoundManager.instance.playBackgroundMusic(soundFileName: "home", volume: 0.04)
            }
        }
        .accentColor(Color("Terciary"))
        .navigationBarBackButtonHidden(true)
        .alert("Conteúdo Bloqueado", isPresented: $showingOnboarding) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("As receitas dessa cultura ainda estão bloqueadas, continue jogando para desbloqueá-las!")
        }
            
    }
}

#Preview {
    Home()
}

