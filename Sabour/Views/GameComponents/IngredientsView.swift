//
//  IngredientsView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 17/05/25.
//

import SwiftUI

struct IngredientsView: View {
    let recipe: Recipe

    @State private var selectedIngredients: Set<UUID> = []
    @State var selectedIngredientsQuantity: Int = 0
    @State private var shouldDiminuir = false
    @State private var showEnlargedRecipeImage: Bool = false
    
    @EnvironmentObject var gameTimerManager: GameTimerManager

    @State private var showExitConfirmationAlert = false
    @Environment(\.dismiss) var dismiss

    var originalColorForSelection: Color {
        if selectedIngredientsQuantity < (recipe.rightIngredientQuantities / 2) {
            return Color("Bad")
        } else if selectedIngredientsQuantity < recipe.rightIngredientQuantities {
            return Color("Medium")
        } else {
            return Color("Good")
        }
    }

    var body: some View {
        ZStack {
            NavigationStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack {
                            IngredientsHeaderSectionView(
                                recipe: recipe,
                                shouldDiminuir: shouldDiminuir,
                                selectedIngredients: $selectedIngredients,
                                isPresentingEnlargedView: $showEnlargedRecipeImage
                            )

                            IngredientSelectionSectionView(
                                recipe: recipe,
                                ingredientsForListing: recipe.ingredients,
                                selectedIngredients: $selectedIngredients,
                                selectedIngredientsQuantity: $selectedIngredientsQuantity
                            )
                        }
                        .onChange(of: selectedIngredientsQuantity) { oldValue, newValue in
                            if newValue == recipe.rightIngredientQuantities {
                                withAnimation {
                                    proxy.scrollTo("ScrollToBottom", anchor: .bottom)
                                }
                            }
                        }
                        .task {
                            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                            shouldDiminuir = true
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    showExitConfirmationAlert = true
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(.black)
                                }
                            }
                            ToolbarItem() {
                                IngredientsToolbarContentView(
                                    selectedIngredientsQuantity: selectedIngredientsQuantity,
                                    totalIngredientsQuantity: recipe.rightIngredientQuantities,
                                    colorForSelection: originalColorForSelection
                                )
                            }
                        }
                        .toolbarBackground(Color("Color1"), for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
                        .navigationBarBackButtonHidden(true)
                        .alert("Confirmar Saída", isPresented: $showExitConfirmationAlert) {
                            Button("Cancelar", role: .cancel) {
                            }
                            Button("Sair da Receita", role: .destructive) {
                                SoundManager.instance.stopBackgroundMusicNow()
                                SoundManager.instance.playBackgroundMusic(soundFileName: "home", volume: 0.04)
                                gameTimerManager.stopTimer()
                                dismiss()                             }
                        } message: {
                            Text("Se você sair agora, perderá o progresso atual nesta receita. Deseja continuar?")
                        }
                    }
                }
            }
            .allowsHitTesting(!showEnlargedRecipeImage)

            if showEnlargedRecipeImage {
                EnlargedImageOverlayView(
                    imageUrlString: recipe.image,
                    isPresented: $showEnlargedRecipeImage
                )
            }
        }
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 200_000_000)
                ToolbarCounterTip.showToolbarTip = true
                
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                ClickableRecipeImageTip.showImageTip = true
            }
        }
    }
}

//#Preview {
//    IngredientsView()
//}
