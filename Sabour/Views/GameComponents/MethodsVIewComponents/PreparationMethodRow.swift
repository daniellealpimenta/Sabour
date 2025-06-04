//
//  PreparationMethodRow.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 26/05/25.
//

import SwiftUI

struct PreparationMethodRow: View {
    let method: PreparationMethod
    @Binding var selectedMethods: [UUID] 
    @Binding var selectedMethodsQuantity: Int
    let maxSelection: Int

    private var isSelected: Bool {
        selectedMethods.contains(method.id)
    }

    private var isAtLimit: Bool {
        selectedMethodsQuantity >= maxSelection
    }

    private var shouldDimIcon: Bool {
        isAtLimit && !isSelected
    }

    private var iconName: String {
        isSelected ? "checkmark.circle.fill" : "checkmark.circle"
    }

    private var iconColor: Color {
        if isSelected {
            return Color("Good")
        } else {
            return shouldDimIcon ? Color("Color2").opacity(0.3) : Color("Color2")
        }
    }

    private var textColor: Color {
        isSelected ? Color("Good") : Color("Color2")
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(method.iconImageName)
                .resizable()
                .frame(width: 48, height: 48)

            Text(method.name)
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
                selectedMethods.removeAll(where: { $0 == method.id })
                selectedMethodsQuantity -= 1
                SoundManager.instance.playSoundEffect(soundFileName: "clickDiselect", volume: 0.035)
            } else {
                if !isAtLimit {
                    selectedMethods.append(method.id)
                    selectedMethodsQuantity += 1
                    SoundManager.instance.playSoundEffect(soundFileName: "clickSelect", volume: 0.035)
                }
                else {
                    SoundManager.instance.playSoundEffect(soundFileName: "clickBlocked", volume: 0.035)
                }
            }
        }
    }
}

//#Preview {
//    PreparationMethodRow()
//}
