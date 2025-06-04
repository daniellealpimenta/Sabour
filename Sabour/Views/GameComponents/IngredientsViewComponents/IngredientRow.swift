//
//  IngredientRow.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import SwiftUI

struct IngredientRow: View {
    let ingredient: Ingredient
    @Binding var selectedIngredients: Set<UUID>
    @Binding var selectedIngredientsQuantity: Int
    let maxSelection: Int

    private var isSelected: Bool {
        selectedIngredients.contains(ingredient.id)
    }

    private var isDisabledVisual: Bool {
        selectedIngredientsQuantity >= maxSelection && !isSelected
    }

    private var iconName: String {
        isSelected ? "checkmark.circle.fill" : "checkmark.circle"
    }

    private var iconColor: Color {
        if isSelected {
            return Color("Good")
        } else {
            return isDisabledVisual ? Color("Color2").opacity(0.3) : Color("Color2")
        }
    }

    private var textColor: Color {
        isSelected ? Color("Good") : Color("Color2")
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(ingredient.imageName)
                .resizable()
                .frame(width: 48, height: 48)

            Text(ingredient.translatedName)
                .font(.custom("Quicksand", size: 18))
                .foregroundColor(textColor)

            Spacer()

            Image(systemName: iconName)
                .foregroundColor(iconColor)
                .imageScale(.large)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 11)
        .frame(maxWidth: 333, alignment: .leading)
        .background(.white)
        .cornerRadius(13)
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .inset(by: 1)
                .stroke(isSelected ? Color("Good") : Color("Color2"), lineWidth: 2)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            if isSelected {
                selectedIngredients.remove(ingredient.id)
                selectedIngredientsQuantity -= 1
                SoundManager.instance.playSoundEffect(soundFileName: "clickDiselect", volume: 0.035)
            } else {
                if selectedIngredientsQuantity < maxSelection {
                    selectedIngredients.insert(ingredient.id)
                    selectedIngredientsQuantity += 1
                    SoundManager.instance.playSoundEffect(soundFileName: "clickSelect", volume: 0.035)
                }
                else{
                    SoundManager.instance.playSoundEffect(soundFileName: "clickBlocked", volume: 0.035)
                }
            }
        }
    }
}

//#Preview {
//    IngredientRow()
//}
