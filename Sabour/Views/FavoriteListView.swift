//
//  FavoriteListView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 03/06/25.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var selectedRecipeForNavigation: Recipe? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Color1").edgesIgnoringSafeArea(.all)

                if favoritesManager.favoriteRecipes.isEmpty {
                    // MARK: - Estado Vazio
                    VStack(spacing: 15) {
                        Image(systemName: "heart.slash.fill")
                            .font(.system(size: 60, weight: .light))
                            .foregroundColor(Color("Color2").opacity(0.6))
                        
                        Text("Nenhuma receita favoritada ainda.")
                            .font(Font.custom("Quicksand", size: 20).weight(.medium))
                            .foregroundColor(Color("Color2").opacity(0.8))
                            .multilineTextAlignment(.center)
                        
                        Text("Explore e adicione suas receitas preferidas aos favoritos!")
                            .font(Font.custom("Quicksand", size: 16))
                            .foregroundColor(Color("Color2").opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding()
                } else {
                    // MARK: - Lista de Favoritos
                    List {
                        ForEach(favoritesManager.favoriteRecipes) { recipe in
                            FavoriteRowLayout(recipe: recipe)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                SoundManager.instance.playSoundEffect(soundFileName: "popButton", volume: 0.7)
                                self.selectedRecipeForNavigation = recipe
                                self.showDetailView = true
                            }
                            .listRowInsets(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: deleteFavorite)
                    }
                    .listStyle(.plain)
                    .background(Color.clear)
                    .padding(.top, 5)
                }
            }
            .navigationTitle("Receitas Favoritas").foregroundColor(Color("Color2"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("Color1"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Receitas Favoritas")
                        .font(Font.custom("Bodoni 72", size: 20).weight(.semibold))
                        .foregroundColor(Color("Color2"))
                }
            }
            .navigationDestination(isPresented: $showDetailView) {
                            if let recipeToView = selectedRecipeForNavigation {
                                FavoriteRecipeDetailView(recipe: recipeToView)
                            } else {
                                EmptyView()
                            }
                        }
        }
    }

    private func deleteFavorite(at offsets: IndexSet) {
        offsets.forEach { index in
            let recipeToRemove = favoritesManager.favoriteRecipes[index]
            favoritesManager.removeFavorite(recipe: recipeToRemove)
        }
    }
}

struct FavoriteRowLayout: View {
    let recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        HStack(spacing: 15) {
            // MARK: - Imagem da Receita
            AsyncImage(url: URL(string: recipe.image )) { phase in
                if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } else if phase.error != nil {
                    ZStack {
                        Color.gray.opacity(0.2)
                        Image(systemName: "fork.knife.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                } else {
                    ZStack {
                        Color.gray.opacity(0.1)
                        ProgressView()
                    }
                }
            }
            .frame(width: 80, height: 80)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)

            // MARK: - Nome da Receita e Botão de Desfavoritar
            HStack {
                Text(recipe.name)
                    .font(Font.custom("Bodoni 72", size: 20).weight(.bold))
                    .foregroundColor(Color("Color2"))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)

                Spacer()

                Button {
                    favoritesManager.removeFavorite(recipe: recipe)
                    SoundManager.instance.playSoundEffect(soundFileName: "favorite_removed", volume: 0.7)
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                }
                .buttonStyle(.plain)
            }
            
        }
        .padding(12)
        .background(Color("Quintenary"))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}
