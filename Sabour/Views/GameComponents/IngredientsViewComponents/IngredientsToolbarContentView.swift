//
//  IngredientsToolbarContentView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 27/05/25.
//

import SwiftUI
import TipKit

struct IngredientsToolbarContentView: View {
    let selectedIngredientsQuantity: Int
    let totalIngredientsQuantity: Int 
    let colorForSelection: Color

    var body: some View {
        HStack{
            Text("\(selectedIngredientsQuantity)/\(totalIngredientsQuantity)")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(colorForSelection)
        }.popoverTip(ToolbarCounterTip())
        
    }
}

//#Preview {
//    IngredientsToolbarContentView()
//}
