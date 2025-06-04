//
//  IngredientSelectionSectionView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import SwiftUI

struct IngredientSelectionSectionView: View {
    let recipe: Recipe
    let ingredientsForListing: [Ingredient]
    
    @Binding var selectedIngredients: Set<UUID>
    @Binding var selectedIngredientsQuantity: Int
    
    @State private var shuffledIngredients: [Ingredient] = []
    @State private var showingQuantityAlert: Bool = false
    
    @State private var shouldNavigateToMethodsView: Bool = false

    init(recipe: Recipe, ingredientsForListing: [Ingredient], selectedIngredients: Binding<Set<UUID>>, selectedIngredientsQuantity: Binding<Int>) {
        self.recipe = recipe
        self.ingredientsForListing = ingredientsForListing
        self._selectedIngredients = selectedIngredients
        self._selectedIngredientsQuantity = selectedIngredientsQuantity
    }

    var body: some View {
        VStack(alignment: .center) {
            Text("Selecione os ingredientes")
                .font(Font.custom("Quicksand", size: 25).weight(.bold))
                .multilineTextAlignment(.center)
                .kerning(1)
                .foregroundColor(Color("Color2"))
                .padding(.vertical, 14)

            VStack(spacing: 12) {
                ForEach(shuffledIngredients) { ingredient in
                    IngredientRow(
                        ingredient: ingredient,
                        selectedIngredients: $selectedIngredients,
                        selectedIngredientsQuantity: $selectedIngredientsQuantity,
                        maxSelection: recipe.rightIngredientQuantities
                    )
                }
            }
            
            VStack {
                if selectedIngredientsQuantity == recipe.rightIngredientQuantities {
                    Button(action: {
                                SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.5)
                    
                                self.shouldNavigateToMethodsView = true
                            }) {
                                Image("Botao2").padding(.top, 10)
                            }
                } else {
                    Button(action: {
                        SoundManager.instance.playSoundEffect(soundFileName: "buttonWrong", volume: 0.08)
                        showingQuantityAlert = true
                    }){
                        Image("Botao3").padding(.top, 10)
                    }
                }
            }
            .id("ScrollToBottom")
            .padding(.bottom, 40)
            .alert("Seleção Incompleta", isPresented: $showingQuantityAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Por favor, selecione todos os \(recipe.rightIngredientQuantities) ingredientes indicados para prosseguir.")
            }
        }
        .onAppear {
            if shuffledIngredients.isEmpty {
                self.shuffledIngredients = ingredientsForListing.shuffled()
            }
        }
        .navigationDestination(isPresented: $shouldNavigateToMethodsView) {
            MethodsView(selectedIngredients: Array(self.selectedIngredients), recipe: self.recipe)
        }
    }
}

//#Preview {
//    IngredientSelectionSectionView()
//}
