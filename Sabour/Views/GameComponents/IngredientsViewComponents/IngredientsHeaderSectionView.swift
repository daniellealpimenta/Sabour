//
//  IngredientsHeaderSectionView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import SwiftUI
import TipKit

struct IngredientsHeaderSectionView: View {
    let recipe: Recipe
    let shouldDiminuir: Bool
    @Binding var selectedIngredients: Set<UUID>
    @Binding var isPresentingEnlargedView: Bool

    var body: some View {
        VStack(alignment: .leading) {
            RecipeImageView(
                recipe: recipe,
                diminuir: shouldDiminuir,
                isPresentingEnlargedView: $isPresentingEnlargedView
            )
            .popoverTip(ClickableRecipeImageTip())
            .padding(.top, 20)

            ZStack(alignment: .topLeading) {
                Image("Ingredientes")
                
                if (selectedIngredients.count <= 12) {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 48), spacing: 10)],
                        spacing: 10
                    ) {
                        ForEach(recipe.ingredients.filter { selectedIngredients.contains($0.id) }) { ingredient in
                            Image(ingredient.imageName)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                            
                        }
                    }
                    .padding(.top, 190)
                    .padding(.leading, 15)
                    .frame(width: 373, height: 99)
                }
                else {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 48), spacing: 10)],
                        spacing: 5
                    ) {
                        ForEach(recipe.ingredients.filter { selectedIngredients.contains($0.id) }) { ingredient in
                                Image(ingredient.imageName)
                                    .resizable()
                                    .frame(width: 28, height: 28)
                            
                        }
                    }
                    .padding(.top, 190)
                    .padding(.leading, 15)
                    .frame(width: 373, height: 99)
                }
            }
        }
    }
}

//#Preview {
//    IngredientsHeaderSectionView()
//}
