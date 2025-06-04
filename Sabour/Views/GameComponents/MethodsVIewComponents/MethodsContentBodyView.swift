//
//  MethodsContentBodyView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 31/05/25.
//

import SwiftUI

struct MethodsContentBodyView: View {
    let recipe: Recipe
    let shouldDiminuir: Bool
    @Binding var showEnlargedRecipeImage: Bool
    
    let selectedMethodImageName: String

    let selectedIngredients: [UUID]
    @Binding var selectedMethods: [UUID]
    @Binding var selectedMethodsQuantity: Int

    var body: some View {
        VStack {
            RecipeImageView(
                recipe: recipe,
                diminuir: shouldDiminuir,
                isPresentingEnlargedView: $showEnlargedRecipeImage
            )

            ZStack(alignment: .topLeading) {
                Image(selectedMethodImageName)
            }

            Text("Selecione os modos de preparo")
                .font(Font.custom("Quicksand", size: 25).weight(.bold))
                .kerning(1).multilineTextAlignment(.center).foregroundColor(.black)
                .frame(width: 335, alignment: .center).padding(.vertical, 14)
            
            MethodSelectionListView(
                recipe: recipe,
                methodsForListing: recipe.preparationMethods,
                selectedIngredients: selectedIngredients,
                selectedMethods: $selectedMethods,
                selectedMethodsQuantity: $selectedMethodsQuantity
            )
            
            Color.clear.frame(height: 1).id("ScrollToBottom")
        }
    }
}
