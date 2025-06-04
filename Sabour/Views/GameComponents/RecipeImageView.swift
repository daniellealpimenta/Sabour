//
//  RecipeImageView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 17/05/25.
//

import SwiftUI

struct RecipeImageView: View {
    let recipe: Recipe
    let diminuir: Bool
    @Binding var isPresentingEnlargedView: Bool

    var body: some View {
        VStack {
            if diminuir {
                HStack(alignment: .center, spacing: 13) {
                    if let url = URL(string: recipe.image) {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView().frame(width: 60, height: 67)
                        }
                        .frame(height: 67)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ImageBorder"), lineWidth: 2)
                        )
                        .padding(.leading, 18)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.isPresentingEnlargedView = true
                            }
                        }
                    }
                    Text(recipe.name)
                        .font(Font.custom("Bodoni 72", size: 25).weight(.bold))
                        .foregroundStyle(Color("Color2"))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 8).padding(.bottom, 20)
            } else {
                VStack(alignment: .center, spacing: 14) {
                    if let url = URL(string: recipe.image) {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView().frame(width: 130, height: 140)
                        }
                        .frame(height: 140)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ImageBorder"), lineWidth: 2)
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.isPresentingEnlargedView = true
                            }
                        }
                    }
                    Text(recipe.name)
                        .font(Font.custom("Bodoni 72", size: 25).weight(.bold))
                        .foregroundStyle(Color("Color2"))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 8).padding(.bottom, 14).padding(.horizontal)
            }
        }
        .animation(.easeInOut, value: diminuir) 
    }
}

//#Preview {
//    RecipeImageView()
//}
