//
//  GameView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 17/05/25.
//

import SwiftUI

struct GameView: View {
    var meal = MealService()
    var recipeResponse = RecipeCreation()
    @EnvironmentObject var gameTimerManager: GameTimerManager
    @EnvironmentObject var globalAppState: GlobalAppState
    
    @State private var recipe: Recipe?
    @State private var isLoadingRecipe: Bool = true

    var body: some View {
        ZStack {
            if isLoadingRecipe {
                VStack {
                    ProgressView("Carregando sua aventura culinária...").font(Font.custom("Bodoni 72", size: 15).weight(.bold))
                        .multilineTextAlignment(.center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                        .scaleEffect(1.5)
                        .padding()
                    Text("Só um momentinho!").font(Font.custom("Quicksand", size: 15))
                        .foregroundColor(.gray)
                }.foregroundStyle(Color("Color2"))
            } else if let recipePass = recipe {
                IngredientsView(recipe: recipePass)
            } else {
                VStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .padding(.bottom)
                    Text("Oops! Algo deu errado.")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Não conseguimos carregar a receita. Por favor, tente novamente mais tarde.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
        }
        .onAppear {
            SoundManager.instance.stopBackgroundMusicWithFade()
            
            if !gameTimerManager.isRunning && !isLoadingRecipe {
                gameTimerManager.startTimer()
            }
            
            let cultura = globalAppState.culturaAtual
            var somDaCultura = ""
            if cultura == "Japan" { somDaCultura = "japanese" }
            else if cultura == "France" { somDaCultura = "french" }
            else if cultura == "Mexico" { somDaCultura = "mexican" }
            else { somDaCultura = "italian" }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                SoundManager.instance.playBackgroundMusic(soundFileName: somDaCultura, volume: 0.04)
            }

            
        }
        .task {
            guard let currentSearchableRecipe = SearchableRecipes.getRecipes(for: globalAppState.culturaAtual).randomElement() else {
                    isLoadingRecipe = false
                    return 
                }
            
            isLoadingRecipe = true
            await meal.getMeal(content: currentSearchableRecipe.name)

            if !meal.meals.isEmpty {
                recipe = recipeResponse.createRecipe(from: meal.meals[0], correctPreparationMethods: currentSearchableRecipe.preparationMethods)
            } else {
                print("Nenhuma refeição encontrada para o conteúdo especificado.")
                recipe = nil
            }
            isLoadingRecipe = false

            if recipe != nil && !gameTimerManager.isRunning {
                gameTimerManager.startTimer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        .background(Color("Color1"))
    }
}

#Preview {
    GameView()
}
