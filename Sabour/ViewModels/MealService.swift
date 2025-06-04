//
//  MealService.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 21/05/25.
//

import Foundation

class MealService: ObservableObject {
    @Published var meals: [Meal] = []
    
    func getMeal(content: String) async {
        let formattedName = content.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(formattedName)") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MealResponse.self, from: data)
            DispatchQueue.main.async {
                self.meals = decoded.meals
            }
        } catch {
            print("Erro ao buscar ou decodificar dados: \(error)")
        }
    }
}



