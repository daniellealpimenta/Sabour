//
//  MethodsView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 19/05/25.
//

import SwiftUI

struct MethodsView: View {
    @State private var selectedMethods: [UUID] = []
    @State var selectedMethodsQuantity: Int = 0
    @State private var shouldDiminuir = false
    let selectedIngredients: [UUID]
    let recipe: Recipe

    @State private var showEnlargedRecipeImage: Bool = false
    @EnvironmentObject var gameTimerManager: GameTimerManager

    @State private var showExitConfirmationAlert = false
    @Environment(\.dismiss) var dismiss

    var colorForSelection: Color {
        if selectedMethodsQuantity < (recipe.rightPreparationMethodsQuantities / 2) { return Color("Bad") }
        else if selectedMethodsQuantity < recipe.rightPreparationMethodsQuantities { return Color("Medium") }
        else { return Color("Good") }
    }

    private var selectedMethodImageName: String {
        if selectedMethods.isEmpty {
            return "ModoDePreparoDefault"
        }
        if let lastSelectedId = selectedMethods.last,
           let method = recipe.preparationMethods.first(where: { $0.id == lastSelectedId }),
           !method.imageName.isEmpty {
            return method.imageName
        }
        return "ModoDePreparoDefault"
    }

    var body: some View {
        ZStack {
            NavigationStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        MethodsContentBodyView(
                            recipe: recipe,
                            shouldDiminuir: shouldDiminuir,
                            showEnlargedRecipeImage: $showEnlargedRecipeImage,
                            selectedMethodImageName: selectedMethodImageName,
                            selectedIngredients: selectedIngredients,
                            selectedMethods: $selectedMethods,
                            selectedMethodsQuantity: $selectedMethodsQuantity
                        )
                        .onChange(of: selectedMethodsQuantity) { oldValue, newValue in
                            if newValue == recipe.rightPreparationMethodsQuantities {
                                withAnimation {
                                    proxy.scrollTo("ScrollToBottom", anchor: .bottom)
                                }
                            }
                        }
                        .task {
                             try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                             self.shouldDiminuir = true
                        }
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
                            Text("\(selectedMethodsQuantity)/\(recipe.rightPreparationMethodsQuantities)")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(colorForSelection)
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
                            dismiss()
                        }
                    } message: {
                        Text("Se você sair agora, perderá o progresso atual nesta receita. Deseja continuar?")
                    }
                }
            }
            .background(Color("Color1"))
            .allowsHitTesting(!showEnlargedRecipeImage)

            if showEnlargedRecipeImage {
                EnlargedImageOverlayView(
                    imageUrlString: recipe.image,
                    isPresented: $showEnlargedRecipeImage
                )
            }
        }
    }
}

//#Preview {
//    MethodsView()
//}
