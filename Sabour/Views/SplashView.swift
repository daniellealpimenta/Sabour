//
//  SplashView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 03/06/25.
//

import SwiftUI
import DotLottie



struct SplashView: View {
    @State private var isActive = false

    let gradientBackground = Gradient(colors: [
        Color("Gradient1"),
        Color("Gradient2")
    ])

    var body: some View {
        if isActive {
            Home()
                .transition(.opacity)
        } else {
            ZStack{
                VStack(spacing: 30) {
                    Spacer()

                    DotLottieAnimation(fileName: "animationLoad", config: AnimationConfig(autoplay: true, loop: true)).view()

                    Spacer()

                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        LinearGradient(gradient: gradientBackground, startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                    )
                
                Text("Sabour")
                    .font(Font.custom("Bodoni 72", size: 50).weight(.bold))
                    .foregroundStyle(Color("Color2"))
                    .padding(.top, 460)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Color1"))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    withAnimation(.easeOut(duration: 0.7)) {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
