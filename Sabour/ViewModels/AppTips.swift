//
//  AppTips.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 31/05/25.
//

import TipKit
import SwiftUI

struct ClickableRecipeImageTip: Tip {
    @Parameter static var showImageTip: Bool = false

    var title: Text {
        Text("Ampliar Imagem")
    }

    var message: Text? {
        Text("Toque na imagem da receita para vê-la maior e com mais detalhes!")
    }

    var image: Image? {
        Image(systemName: "magnifyingglass.circle.fill")
    }

    var rules: [Rule] {
            
            #Rule(Self.$showImageTip) { isReadyToShow in
                isReadyToShow
            }
            
        }
    
    var options: [TipOption] {
        MaxDisplayCount(1)
    }
}

struct ToolbarCounterTip: Tip {
    @Parameter static var showToolbarTip: Bool = false

    var title: Text {
        Text("Acompanhe seu Progresso!")
    }

    var message: Text? {
        Text("Veja quantos ingredientes corretos já selecionou.")
    }

    var image: Image? {
        Image(systemName: "text.badge.checkmark")
    }

    var rules: [Rule] {
            
            #Rule(Self.$showToolbarTip) { isReadyToShow in
                isReadyToShow
            }
        }
    
    var options: [TipOption] {
        MaxDisplayCount(1)
    }
}


