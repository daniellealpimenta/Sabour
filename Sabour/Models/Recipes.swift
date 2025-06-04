//
//  Recipes.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 13/05/25.
//

import Foundation

struct Recipe: Identifiable, Codable, Equatable {
    var id: String { idMeal }
    let idMeal: String
    
    let name: String
    let image: String
    let video: String
    let reference: String
    let ingredients: [Ingredient]
    let rightIngredients: [Ingredient]
    let rightIngredientQuantities: Int
    let preparationMethods: [PreparationMethod]
    let rightPreparationMethods: [PreparationMethod]
    let rightPreparationMethodsQuantities: Int
    let instructions: String
    
    var translatedInstructions_pt: String? 
    var translatedMeasures_pt: [UUID: String]?
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.idMeal == rhs.idMeal
    }
    
    init(idMeal: String, name: String, image: String, video: String, reference: String,
             ingredients: [Ingredient], rightIngredients: [Ingredient], rightIngredientQuantities: Int,
             preparationMethods: [PreparationMethod], rightPreparationMethods: [PreparationMethod], rightPreparationMethodsQuantities: Int,
             instructions: String,
             translationData: RecipeTranslation? = nil) { // Opcional: dados de tradução
            
            self.idMeal = idMeal
            self.name = name
            self.image = image
            self.video = video
            self.reference = reference
            self.ingredients = ingredients
            self.rightIngredients = rightIngredients // Estes já têm a 'measure' original em inglês
            self.rightIngredientQuantities = rightIngredientQuantities
            self.preparationMethods = preparationMethods
            self.rightPreparationMethods = rightPreparationMethods
            self.rightPreparationMethodsQuantities = rightPreparationMethodsQuantities
            self.instructions = instructions

            // Processa as traduções se disponíveis
            if let translation = translationData, translation.idMeal == self.idMeal {
                self.translatedInstructions_pt = translation.translatedInstructions
                
                if let specificMeasures = translation.translatedMeasures {
                    var measuresDict: [UUID: String] = [:]
                    for ingredient in self.rightIngredients {
                        // A chave em specificMeasures é o NOME EM INGLÊS do ingrediente
                        if let translatedMeasure = specificMeasures[ingredient.name] {
                            measuresDict[ingredient.id] = translatedMeasure
                        }
                    }
                    if !measuresDict.isEmpty {
                        self.translatedMeasures_pt = measuresDict
                    }
                }
            }
        }

    func calcularAcerto(selectedIngredients: Set<UUID>, selectedPreparationMethods: Set<UUID>) -> Int {
        let ingredientesCorretos = Set(self.rightIngredients.map { $0.id })
        let metodosCorretos = Set(self.rightPreparationMethods.map { $0.id })

        let acertosIngredientes = selectedIngredients.intersection(ingredientesCorretos).count
        let acertosMetodos = selectedPreparationMethods.intersection(metodosCorretos).count

        let totalCorretos = ingredientesCorretos.count + metodosCorretos.count
        let totalAcertos = acertosIngredientes + acertosMetodos

        guard totalCorretos > 0 else {
            return 0
        }

        let porcentagemBruta = (Double(totalAcertos) / Double(totalCorretos)) * 100.0

        let resultadoFinal = Int(round(porcentagemBruta))

        return resultadoFinal
    }
}
