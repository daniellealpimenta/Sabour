//
//  FavoriteManager.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 03/06/25.
//

import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = []
    private let favoritesKey = "kitchenApp_favoriteRecipes_v2" // Mude se a estrutura da Recipe mudar drasticamente

    init() {
        loadFavorites()
    }

    func isFavorite(recipe: Recipe) -> Bool {
        favoriteRecipes.contains(where: { $0.idMeal == recipe.idMeal })
    }

    func addFavorite(recipe: Recipe) {
        if !isFavorite(recipe: recipe) {
            favoriteRecipes.append(recipe)
            saveFavorites()
        }
    }

    func removeFavorite(recipe: Recipe) {
        favoriteRecipes.removeAll(where: { $0.idMeal == recipe.idMeal })
        saveFavorites()
    }
    
    func toggleFavorite(recipe: Recipe) {
        if isFavorite(recipe: recipe) {
            removeFavorite(recipe: recipe)
        } else {
            addFavorite(recipe: recipe)
        }
    }

    private func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(favoriteRecipes)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        } catch {
            print("Falha ao salvar favoritos: \(error.localizedDescription)")
        }
    }

    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else { return }
        do {
            favoriteRecipes = try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            print("Falha ao carregar favoritos: \(error.localizedDescription)")
        }
    }
}
