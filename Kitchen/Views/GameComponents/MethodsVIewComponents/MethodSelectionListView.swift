//
//  MethodSelectionListView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import SwiftUI

struct MethodSelectionListView: View {
    let recipe: Recipe
    let methodsForListing: [PreparationMethod]
    let selectedIngredients: [UUID]
    
    @Binding var selectedMethods: [UUID]
    @Binding var selectedMethodsQuantity: Int
    
    @State private var shuffledMethods: [PreparationMethod] = []
    @State private var showingQuantityAlert: Bool = false
    
    @State private var shouldNavigateToAnalysisView: Bool = false
    
    init(recipe: Recipe, methodsForListing: [PreparationMethod], selectedIngredients: [UUID], selectedMethods: Binding<[UUID]>, selectedMethodsQuantity: Binding<Int>) {
        self.recipe = recipe
        self.methodsForListing = methodsForListing
        self.selectedIngredients = selectedIngredients
        self._selectedMethods = selectedMethods
        self._selectedMethodsQuantity = selectedMethodsQuantity
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(shuffledMethods, id: \.id) { method in
                PreparationMethodRow(
                    method: method,
                    selectedMethods: $selectedMethods,
                    selectedMethodsQuantity: $selectedMethodsQuantity,
                    maxSelection: recipe.rightPreparationMethodsQuantities
                )
            }
            VStack {
                if selectedMethodsQuantity == recipe.rightPreparationMethodsQuantities {
                    Button(action: {
                        SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                        
                        self.shouldNavigateToAnalysisView = true
                    }) {
                        Image("Botao8").padding(.top, 10)
                    }
                    
                } else {
                    Button(action: {
                        SoundManager.instance.playSoundEffect(soundFileName: "buttonWrong", volume: 0.08)
                        showingQuantityAlert = true
                    }) {
                        Image("Botao7").padding(.top, 10)
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
            if shuffledMethods.isEmpty {
                self.shuffledMethods = methodsForListing.shuffled()
            }
        }
        .navigationDestination(isPresented: $shouldNavigateToAnalysisView) {
            AnalysisView(
                recipe: self.recipe,
                selectedIngredients: self.selectedIngredients,
                selectedPreparations: self.selectedMethods
            )
        }
    }
}

//#Preview {
//    MethodSelectionListView()
//}
