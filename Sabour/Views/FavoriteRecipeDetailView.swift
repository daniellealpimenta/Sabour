//
//  FavoriteRecipeDetailView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 03/06/25.
//

import SwiftUI

struct FavoriteRecipeDetailView: View {
    let recipe: Recipe

    private var videoId: String? {
        guard !recipe.video.isEmpty else { return nil }
        let urlString = recipe.video
        if let VRange = urlString.range(of: "v="), let endRange = urlString[VRange.upperBound...].range(of: "&") {
            return String(urlString[VRange.upperBound..<endRange.lowerBound])
        } else if let VRange = urlString.range(of: "v=") {
            return String(urlString[VRange.upperBound...])
        } else if urlString.count == 11 && !urlString.contains("http") && !urlString.contains("/") {
            return urlString
        }
        return nil
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: recipe.image)) { phase in
                    switch phase {
                    case .empty:
                        ZStack { Color.gray.opacity(0.1); ProgressView() }.frame(height: 250)
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fill)
                            .frame(height: 250).clipped()
                    case .failure:
                        ZStack { /* ... placeholder de erro ... */ }.frame(height: 250)
                    @unknown default:
                        EmptyView().frame(height: 250)
                    }
                }
                .frame(maxWidth: .infinity)

                Text(recipe.name)
                    .font(Font.custom("Bodoni 72", size: 28).weight(.bold))
                    .foregroundColor(Color("Color2"))
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 10)

                SectionView(title: "Ingredientes") {
                     if recipe.rightIngredients.isEmpty {
                        Text("Nenhum ingrediente listado.").italic().foregroundColor(Color("Color2").opacity(0.7))
                    } else {
                        VStack(alignment: .leading, spacing: 3) {
                            ForEach(recipe.rightIngredients) { ingredient in
                                HStack(alignment: .top) {
                                    Image(ingredient.imageName)
                                        .resizable().frame(width: 22, height: 22).padding(.trailing, 5)
                                    Text(ingredient.translatedName)
                                        .font(Font.custom("Quicksand", size: 17).weight(.medium))
                                        .foregroundColor(Color("Color2"))
                                    Text(recipe.translatedMeasures_pt?[ingredient.id] ?? ingredient.measure)
                                        .font(Font.custom("Quicksand", size: 16))
                                        .foregroundColor(Color("Terciary").opacity(0.9)) // Corrigido para Terciary
                                }
                            }
                        }
                    }
                }

                if !recipe.rightPreparationMethods.isEmpty {
                    SectionView(title: "Métodos de Preparo") {
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(recipe.rightPreparationMethods) { method in
                                HStack(alignment: .top) {
                                    Image(method.iconImageName)
                                        .resizable().frame(width: 22, height: 22).padding(.trailing, 5)
                                    Text(method.name)
                                        .font(Font.custom("Quicksand", size: 16))
                                        .foregroundColor(Color("Color2"))
                                }
                            }
                        }
                    }
                }

                if !recipe.instructions.isEmpty {
                    SectionView(title: "Instruções") {
                        Text(recipe.translatedInstructions_pt ?? recipe.instructions)
                            .font(Font.custom("Quicksand", size: 16)).lineSpacing(5)
                            .foregroundColor(Color("Color2"))
                        if recipe.translatedInstructions_pt == nil && !recipe.instructions.isEmpty {
                            Text("\n(Instruções fornecidas no idioma original.)")
                                .font(.caption).foregroundColor(Color("Color2").opacity(0.7))
                        }
                    }
                }
                
                if let videoId = self.videoId, !videoId.isEmpty {
                    SectionView(title: "Vídeo da Receita") {
                        YoutubePlayer(videoId: videoId)
                            .frame(height: 200)
                            .cornerRadius(8)
                    }
                }

                if !recipe.reference.isEmpty, let url = URL(string: recipe.reference) {
                    SectionView(title: "Referência") {
                        Link("Ver receita original na web", destination: url)
                            .font(Font.custom("Quicksand", size: 16)).foregroundColor(Color("Terciary"))
                    }
                }
                
                Spacer(minLength: 30)
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .background(Color("Color1").edgesIgnoringSafeArea(.all))
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(recipe.name)
                    .font(Font.custom("Bodoni 72", size: 20).weight(.semibold))
                    .foregroundColor(Color("Color2"))
            }

            // MARK: - ShareLink
            ToolbarItem(placement: .navigationBarTrailing) {
                let shareText = """
                Confira esta receita: \(recipe.name)!
                
                Instruções:
                \(recipe.translatedInstructions_pt ?? recipe.instructions)
                """
                
                if !recipe.reference.isEmpty, let referenceURL = URL(string: recipe.reference) {
                    ShareLink(
                        item: referenceURL,
                        subject: Text("Receita: \(recipe.name)"),
                        message: Text("Achei esta receita interessante: \(recipe.name). Veja as instruções e mais detalhes no link!") // O texto pode ser mais genérico se a URL for o foco
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color("Terciary"))
                    }
                } else {
                    ShareLink(
                        item: shareText,
                        subject: Text("Receita: \(recipe.name)")
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(Color("Terciary"))
                    }
                }
            }
        }
        .toolbarBackground(Color("Color1"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct SectionView<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(Font.custom("Bodoni 72", size: 22).weight(.bold))
                .foregroundColor(Color("Color2"))
                .padding(.bottom, 4)
                .padding(.leading)

            content
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("Quintenary"))
                .cornerRadius(10)
        }
    }
}
