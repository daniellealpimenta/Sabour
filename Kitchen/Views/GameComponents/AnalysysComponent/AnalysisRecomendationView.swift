//
//  AnalysisRecomendationView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 26/05/25.
//

import SwiftUI

struct AnalysisRecomendationView: View {
    let recipe: Recipe
    
    let selectedIngredients: [UUID]
    let selectedPreparations: [UUID]
    
    var body: some View {
        ZStack(alignment: .top){
            VStack (alignment: .leading){
                
                Text("Ingredientes da Receita: ").font(Font.custom("Bodoni 72", size: 20).weight(.bold))
                List {
                    ForEach(recipe.rightIngredients) { ingredient in
                        HStack{
                            Image(ingredient.imageName)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 6)
                            Text(ingredient.translatedName)
                                .foregroundStyle(Color("Color2"))
                                .padding(.vertical, 6)
                            
                            Spacer()
                            
                            if (selectedIngredients.contains(ingredient.id)) {
                                Image(systemName: "checkmark").imageScale(.large).foregroundStyle(Color("Good"))
                            } else {
                                Image(systemName: "xmark").imageScale(.large).foregroundStyle(Color("Bad"))
                            }
                                
                        }.listRowBackground(Color("Quintenary"))
                    }
                }
                .frame(width: 348, height: 171)
                .listStyle(.plain)
                .background(Color("Quintenary"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scrollContentBackground(.hidden)
                
                Text("Métodos de Preparo da Receita: ").font(Font.custom("Bodoni 72", size: 20).weight(.bold))
                List {
                    ForEach(recipe.rightPreparationMethods) { method in
                        HStack{
                            Image(method.iconImageName)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 6)
                            Text(method.name)
                                .foregroundStyle(Color("Color2"))
                                .padding(.vertical, 6)
                            
                            Spacer()
                            
                            if (selectedPreparations.contains(method.id)) {
                                Image(systemName: "checkmark").imageScale(.large).foregroundStyle(Color("Good"))
                            } else {
                                Image(systemName: "xmark").imageScale(.large).foregroundStyle(Color("Bad"))
                            }
                                
                        }.listRowBackground(Color("Quintenary"))
                    }
                }
                .frame(width: 348, height: 86)
                .listStyle(.plain)
                .background(Color("Quintenary"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scrollContentBackground(.hidden)
                
                
                
                Text("Como Fazer: ").font(Font.custom("Bodoni 72", size: 20).weight(.bold))
                if recipe.video != "",
                   let videoId = recipe.video.components(separatedBy: "v=").last {
                    YoutubePlayer(videoId: videoId)
                        .frame(width: 348, height: 171)
                        .cornerRadius(8)
                }
                
                Text("Referência da Receita: ").font(Font.custom("Bodoni 72", size: 20).weight(.bold))
                ZStack(alignment: .leading) {
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 348, height: 43)
                    .background(Color("Quintenary"))
                    .cornerRadius(8)
                    
                    if recipe.reference != "", let url = URL(string: recipe.reference) {
                        Link("Receita", destination: url)
                            .foregroundColor(Color("Terciary"))
                            .underline(true, color: Color("Terciary"))
                            .padding(.leading, 16)
                    }
                    else {
                        Text("Referência indisponível").font(Font.custom("Bodoni 72", size: 20).weight(.bold)).padding(.leading, 16)
                    }
                }
                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Color1"))
            .foregroundStyle(Color("Color2"))
    }
}

//#Preview {
//    AnalysisRecomendationView()
//}
