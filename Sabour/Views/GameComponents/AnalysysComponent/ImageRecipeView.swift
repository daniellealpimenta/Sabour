//
//  ImageRecipeView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 20/05/25.
//

import SwiftUI

struct ImageRecipeView: View {
    let recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        ZStack (alignment: .leading){
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 393, height: 90)
              .background(Color("Quarternary"))
              .overlay(
                Rectangle()
                  .inset(by: 1)
                  .stroke(Color("QuarternaryBorder"), lineWidth: 2)
              )
            
            HStack {
                if let url = URL(string: recipe.image) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 77)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("ImageBorder"), lineWidth: 2)
                    )
                }

                Text(recipe.name)
                    .font(Font.custom("Bodoni 72", size: 25).weight(.bold))
                    .foregroundStyle(Color("Color2"))
                    .padding(.leading, 14)
                
                Spacer()
                
                Button {
                    favoritesManager.toggleFavorite(recipe: recipe)
                    SoundManager.instance.playSoundEffect(soundFileName: favoritesManager.isFavorite(recipe: recipe) ? "clickSelect" : "clickDiselect", volume: 0.7)
                } label: {
                    Image(systemName: favoritesManager.isFavorite(recipe: recipe) ? "heart.fill" : "heart")
                        .foregroundColor(favoritesManager.isFavorite(recipe: recipe) ? .red : Color("Color2"))
                        .imageScale(.large)
                }.padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.leading, 19)
        }
                
        
    }
}

//#Preview {
//    ImageRecipeView()
//}
