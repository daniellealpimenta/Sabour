//
//  SearchableRecipes.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 28/05/25.
//

import Foundation

struct SearchableRecipes {
    
    var name: String
    var preparationMethods: [PreparationMethod]
    
    static func getRecipes(for culture: String) -> [SearchableRecipes] {
        if (culture == "Japan") {
            return  [
                SearchableRecipes(name: "Tonkatsu Pork", preparationMethods: PreparationMethod.tonkatsu),
                SearchableRecipes(name: "Japanese Katsudon", preparationMethods: PreparationMethod.katsudon)
            ]
        }
        else if (culture == "France") {
            return [
                SearchableRecipes(name: "Ratatouille", preparationMethods: PreparationMethod.ratatouille),
                SearchableRecipes(name: "Steak Diane", preparationMethods: PreparationMethod.steakDiane)
            ]
        }
        else if (culture == "Mexico") {
            return [
                SearchableRecipes(name: "Cajun Spiced Fish Tacos", preparationMethods: PreparationMethod.cajunSpicedFish),
                SearchableRecipes(name: "Chicken Enchilada Casserole", preparationMethods: PreparationMethod.chickenEnchilada)
            ]
        }
        else {
            return [
                SearchableRecipes(name: "Fettuccine alfredo", preparationMethods: PreparationMethod.fettucine),
                SearchableRecipes(name: "Salmon Prawn Risotto", preparationMethods: PreparationMethod.salmonPrawn)
            ]
        }
    }
    
    
}
