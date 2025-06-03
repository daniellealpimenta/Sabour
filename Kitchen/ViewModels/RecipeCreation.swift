//
//  RecipeCreation.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 23/05/25.
//

import Foundation

struct RecipeCreation {
    
    func createRecipe(from meal: Meal, correctPreparationMethods: [PreparationMethod]) -> Recipe {
        let mirror = Mirror(reflecting: meal)

        let apiIngredientNamesAndMeasures = (1...20).compactMap { index -> (name: String, measure: String)? in
            guard let nameValue = mirror.children.first(where: { $0.label == "strIngredient\(index)" })?.value as? String,
                  let measureValue = mirror.children.first(where: { $0.label == "strMeasure\(index)" })?.value as? String,
                  !nameValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { 
                return nil
            }
            return (name: nameValue.trimmingCharacters(in: .whitespacesAndNewlines),
                    measure: measureValue.trimmingCharacters(in: .whitespacesAndNewlines))
        }

        let matchedIngredientsFromAPI: [Ingredient] = apiIngredientNamesAndMeasures.compactMap { (apiName, apiMeasure) -> Ingredient? in
            if let matchedStaticIngredient = Ingredient.allIngredients.first(where: { staticIngredient -> Bool in
                if staticIngredient.name.caseInsensitiveCompare(apiName) == .orderedSame {
                    return true
                }
                if let aliases = staticIngredient.aliases {
                    for alias in aliases {
                        if alias.caseInsensitiveCompare(apiName) == .orderedSame {
                            return true
                        }
                    }
                }
                return false
            }) {
                return Ingredient(
                    name: matchedStaticIngredient.name,
                    translatedName: matchedStaticIngredient.translatedName,
                    imageName: matchedStaticIngredient.imageName,
                    measure: apiMeasure,
                    aliases: matchedStaticIngredient.aliases
                )
            }
            return nil
        }

        let matchedCanonicalNames = Set(matchedIngredientsFromAPI.map { $0.name })
        let remainingAvailableIngredients = Ingredient.allIngredients.filter { !matchedCanonicalNames.contains($0.name) }
        
        let numberOfExtraIngredients = min(6, remainingAvailableIngredients.count)
        let extraDistractorIngredients = remainingAvailableIngredients.shuffled().prefix(numberOfExtraIngredients).map { distractor -> Ingredient in
            
            return Ingredient(
                name: distractor.name,
                translatedName: distractor.translatedName,
                imageName: distractor.imageName,
                measure: "",
                aliases: distractor.aliases
            )
        }
        
        let allIngredientsForGame = (matchedIngredientsFromAPI + extraDistractorIngredients).shuffled()
        let translationData = RecipeTranslations.getTranslation(for: meal.idMeal)

        return Recipe(
            idMeal: meal.idMeal,
            name: meal.strMeal,
            image: meal.strMealThumb,
            video: meal.strYoutube,
            reference: meal.strSource ?? "",
            ingredients: allIngredientsForGame,
            rightIngredients: matchedIngredientsFromAPI,
            rightIngredientQuantities: matchedIngredientsFromAPI.count,
            preparationMethods: PreparationMethod.allMethods.shuffled(),
            rightPreparationMethods: correctPreparationMethods,
            rightPreparationMethodsQuantities: correctPreparationMethods.count,
            instructions: meal.strInstructions,
            translationData: translationData
        )
    }
}

