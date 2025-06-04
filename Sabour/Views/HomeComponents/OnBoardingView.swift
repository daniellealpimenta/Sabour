//
//  OnBoardingView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 15/05/25.
//

import SwiftUI

struct OnBoardingView: View {
    @Binding var showOnboarding: Bool
    @State private var currentPage = 0

    
    let pages = [
        OnboardingPage(title: "Seja bem vindo ao Sabour!",
                       imageName: "onboard0",
                       description: Text("""
                                        Escolha uma cultura culinária no livro de receitas para começar sua jornada na cozinha! Cada cultura tem seus __sabores, ingredientes e desafios únicos__.
                                    """)),
        OnboardingPage(title: "Como começar?",
                       imageName: "onboard1",
                       description: Text("""
                                        Clique em __\"Cozinhar\"__ para receber uma receita aleatória da cultura que você escolheu. Prepare-se para colocar seus conhecimentos à prova!
                                    """)),
        OnboardingPage(title: "O que devo fazer?",
                       imageName: "onboard2",
                       description: Text("""
                                        Escolha os __ingredientes__ e os __modos de preparo__ que você acha que fazem parte do prato. Capriche na escolha para se aproximar da receita original!
                                    """)),
//        OnboardingPage(title: "O que recebo?",
//                       imageName: "onboard3",
//                       description: Text("""
//                                        Seu prato será comparado com a receita original. Você ganha __XP__ de acordo com sua precisão e isso define seu __ranking__ em cada cultura!
//                                    """))
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    VStack(spacing: 20) {
                        Spacer()
                        
                        Text(pages[index].title)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Color2"))
                            .font(Font.custom("Bodoni 72", size: 25).weight(.bold))
                        
                        Spacer()
                        
                        Image(pages[index].imageName)
                        
                        Spacer()

                        pages[index].description
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .foregroundColor(Color("Color2"))
                            .font(Font.custom("Quicksand", size: 18))
                        
                        if index == pages.count - 1 {
                            Button(action: {
                                showOnboarding = false
                                SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                            }) {
                                Image("Botao5")
                                    .padding(.bottom, 50)
                            }
                        }else {
                            Spacer()
                        }
                        
                        
                    }
                    .tag(index)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .animation(.easeInOut, value: currentPage)
        }
        .interactiveDismissDisabled(true)
        .background(Color("Color1").ignoresSafeArea())
    }
}

struct OnboardingPage {
    let title: String
    let imageName: String
    let description: Text
}

