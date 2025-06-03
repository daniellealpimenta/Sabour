//
//  Ingredients.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 13/05/25.
//

import Foundation

struct Ingredient: Identifiable, Codable, Equatable, Hashable { 
    let id: UUID
    let name: String
    let translatedName: String
    let imageName: String
    let measure: String
    let aliases: [String]?
    
    init(id: UUID = UUID(), name: String, translatedName: String, imageName: String, measure: String, aliases: [String]? = nil) {
        self.id = id
        self.name = name
        self.translatedName = translatedName
        self.imageName = imageName
        self.measure = measure
        self.aliases = aliases
    }
    
    
    static let allIngredients: [Ingredient] = [
        Ingredient(name: "Onion", translatedName: "Cebola", imageName: "cebola", measure: "", aliases: ["onion"]),
        Ingredient(name: "Garlic", translatedName: "Alho", imageName: "alho", measure: "", aliases: ["Garlic Clove", "garlic"]),
        Ingredient(name: "Flour", translatedName: "Farinha", imageName: "farinha", measure: ""),
        Ingredient(name: "Pork chops", translatedName: "Carne de Porco", imageName: "carneDePorco", measure: "", aliases: ["Pork"]),
        Ingredient(name: "Eggs", translatedName: "Ovos", imageName: "ovos", measure: ""),
        Ingredient(name: "Breadcrumbs", translatedName: "Farinha de Rosca", imageName: "farinhaDeRosca", measure: ""),
        Ingredient(name: "Tomato Ketchup", translatedName: "Ketchup", imageName: "ketchup", measure: ""),
        Ingredient(name: "Lime", translatedName: "Limão", imageName: "limao", measure: "", aliases: ["lemon", "Lemon"]),
        Ingredient(name: "Vegetable Oil", translatedName: "Óleo Vegetal", imageName: "oleoVegetal", measure: "", aliases: ["vegetable oil"]),
        Ingredient(name: "Worcestershire Sauce", translatedName: "Molho Inglês", imageName: "molhoIngles", measure: ""),
        Ingredient(name: "Oyster Sauce", translatedName: "Molho de Ostra", imageName: "molhoDeOstra", measure: ""),
        Ingredient(name: "Caster Sugar", translatedName: "Açúcar de Confeiteiro", imageName: "acucarDeConfeiteiro", measure: ""),
        Ingredient(name: "Grated Cheese", translatedName: "Queijo Ralado", imageName: "queijoRalado", measure: "", aliases: ["shredded Monterey Jack cheese"]),
        Ingredient(name: "Tomato", translatedName: "Tomate", imageName: "tomate", measure: ""),
        Ingredient(name: "Chives", translatedName: "Cebolinha", imageName: "cebolinha", measure: "", aliases: ["Spring Onions"]),
        Ingredient(name: "Soy Sauce", translatedName: "Molho de Soja", imageName: "molhoDeSoja", measure: ""),
        Ingredient(name: "Mirin", translatedName: "Vinho de Arroz Doce", imageName: "vinhoDeArrozDoce", measure: ""),
        Ingredient(name: "Sugar", translatedName: "Açúcar", imageName: "acucar", measure: ""),
        Ingredient(name: "Sushi Rice", translatedName: "Arroz para Sushi", imageName: "arrozParaSushi", measure: ""),
        Ingredient(name: "Vegetable Stock", translatedName: "Caldo de Legumes", imageName: "caldoDeLegumes", measure: "", aliases: ["vegetable stock"]),
        Ingredient(name: "Aubergine", translatedName: "Berinjela", imageName: "berinjela", measure: ""),
        Ingredient(name: "Courgettes", translatedName: "Abobrinha", imageName: "abobrinha", measure: ""),
        Ingredient(name: "Yellow Pepper", translatedName: "Pimentão Amarelo", imageName: "pimentaoAmarelo", measure: ""),
        Ingredient(name: "Olive Oil", translatedName: "Azeite de Oliva", imageName: "azeiteDeOliva", measure: ""),
        Ingredient(name: "Basil", translatedName: "Manjericão", imageName: "manjericao", measure: ""),
        Ingredient(name: "Red Wine Vinegar", translatedName: "Vinagre de Vinho Tinto", imageName: "vinagreDeVinhoTinto", measure: ""),
        Ingredient(name: "Canola Oil", translatedName: "Óleo de Canola", imageName: "oleoDeCanola", measure: ""),
        Ingredient(name: "Beef Fillet", translatedName: "Carne Bovina", imageName: "carneBovina", measure: ""),
        Ingredient(name: "Beef Stock", translatedName: "Caldo de Carne", imageName: "caldoDeCarne", measure: ""),
        Ingredient(name: "Butter", translatedName: "Manteiga", imageName: "manteiga", measure: "", aliases: ["butter"]),
        Ingredient(name: "Challots", translatedName: "Chalotas", imageName: "chalotas", measure: ""),
        Ingredient(name: "Brandy", translatedName: "Conhaque", imageName: "conhaque", measure: ""),
        Ingredient(name: "Mushrooms", translatedName: "Cogumelos", imageName: "cogumelos", measure: ""),
        Ingredient(name: "Heavy Cream", translatedName: "Creme de Leite", imageName: "cremeDeLeite", measure: ""),
        Ingredient(name: "Dijon Mustard", translatedName: "Mostarda de Dijon", imageName: "mostardaDeDijon", measure: ""),
        Ingredient(name: "Tabasco Sauce", translatedName: "Molho Tabasco", imageName: "molhoTabasco", measure: ""),
        Ingredient(name: "Parsley", translatedName: "Salsinha", imageName: "salsinha", measure: "", aliases: ["salsa"]),
        Ingredient(name: "Salt", translatedName: "Sal", imageName: "sal", measure: ""),
        Ingredient(name: "Pepper", translatedName: "Pimenta do Reino", imageName: "pimentaDoReino", measure: "", aliases: ["Black Pepper", "black pepper"]),
        Ingredient(name: "cajun", translatedName: "Tempero Cajun", imageName: "temperoCajun", measure: ""),
        Ingredient(name: "cayenne pepper", translatedName: "Pimenta Caiena", imageName: "pimentaCaiena", measure: ""),
        Ingredient(name: "white fish", translatedName: "Peixe de Carne Branca", imageName: "peixeBranco", measure: ""),
        Ingredient(name: "flour tortilla", translatedName: "Tortilha de Farinha", imageName: "tortillaDeFarinha", measure: ""),
        Ingredient(name: "avocado", translatedName: "Abacate", imageName: "abacate", measure: ""),
        Ingredient(name: "little gem lettuce", translatedName: "Alface", imageName: "alface", measure: ""),
        Ingredient(name: "sour cream", translatedName: "Creme Azedo", imageName: "cremeAzedo", measure: ""),
        Ingredient(name: "Enchilada sauce", translatedName: "Molho de Enchilada", imageName: "molhoParaEnchilada", measure: ""),
        Ingredient(name: "corn tortillas", translatedName: "Tortilhas de Milho", imageName: "tortillaDeMilho", measure: ""),
        Ingredient(name: "chicken breasts", translatedName: "Carne de Frango", imageName: "carneDeFrango", measure: ""),
        Ingredient(name: "Fettuccine", translatedName: "Macarrão Fettuccine", imageName: "macarraoFettuccine", measure: ""),
        Ingredient(name: "Parmesan", translatedName: "Queijo Parmesão", imageName: "queijoParmesao", measure: ""),
        Ingredient(name: "rice", translatedName: "Arroz", imageName: "arroz", measure: ""),
        Ingredient(name: "white wine", translatedName: "Vinho Branco", imageName: "vinhoBranco", measure: ""),
        Ingredient(name: "King Prawns", translatedName: "Camarão", imageName: "camarao", measure: ""),
        Ingredient(name: "salmon", translatedName: "Salmão", imageName: "salmao", measure: ""),
        Ingredient(name: "asparagus", translatedName: "Aspargos", imageName: "aspargos", measure: ""),
    ]
}
