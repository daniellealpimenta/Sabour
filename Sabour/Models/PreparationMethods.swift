//
//  PreparationMethods.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 16/05/25.
//

import Foundation

struct PreparationMethod: Identifiable, Codable, Equatable, Hashable { 
    let id: UUID
    let name: String
    let imageName: String
    let iconImageName: String

    init(id: UUID = UUID(), name: String, imageName: String, iconImageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.iconImageName = iconImageName
    }
    
    static let assar = PreparationMethod(id: UUID(), name: "Assar", imageName: "Assar", iconImageName: "assarIcon")
    static let cozinhar = PreparationMethod(id: UUID(), name: "Cozinhar", imageName: "Cozinhar", iconImageName: "cozinharIcon")
    static let empanar = PreparationMethod(id: UUID(), name: "Empanar", imageName: "Empanar", iconImageName: "empanarIcon")
    static let fritar = PreparationMethod(id: UUID(), name: "Fritar", imageName: "Fritar", iconImageName: "fritarIcon")
    static let cortar = PreparationMethod(id: UUID(), name: "Cortar", imageName: "Cortar", iconImageName: "cortarIcon")
    static let refogar = PreparationMethod(id: UUID(), name: "Refogar", imageName: "Refogar", iconImageName: "refogarIcon")
    static let deglacear = PreparationMethod(id: UUID(), name: "Deglacear", imageName: "Deglacear", iconImageName: "deglacearIcon")
    static let flambar = PreparationMethod(id: UUID(), name: "Flambar", imageName: "Flambar", iconImageName: "flambarIcon")
    static let selar = PreparationMethod(id: UUID(), name: "Selar", imageName: "Selar", iconImageName: "selarIcon")
    static let grelhar = PreparationMethod(id: UUID(), name: "Grelhar", imageName: "Grelhar", iconImageName: "grelharIcon")
    static let picar = PreparationMethod(id: UUID(), name: "Picar", imageName: "Picar", iconImageName: "picarIcon")

    
    static let allMethods: [PreparationMethod] = [
        assar,
        cozinhar,
        empanar,
        fritar,
        cortar,
        refogar,
        deglacear,
        flambar,
        selar,
        grelhar,
        picar
    ]

    static let tonkatsu: [PreparationMethod] = [
        empanar,
        fritar 
    ]
    
    static let katsudon: [PreparationMethod] = [
        empanar,
        cozinhar,
        fritar
    ]
    
    static let ratatouille: [PreparationMethod] = [
        cortar,
        refogar,
        assar
    ]
    
    static let steakDiane: [PreparationMethod] = [
        cortar,
        refogar,
        selar,
        flambar,
        cozinhar
    ]
    
    static let cajunSpicedFish: [PreparationMethod] = [
        cortar,
        grelhar
    ]
    
    static let chickenEnchilada: [PreparationMethod] = [
        cortar,
        cozinhar,
        assar
    ]
    
    static let fettucine: [PreparationMethod] = [
        cozinhar,
        picar
    ]
    
    static let salmonPrawn: [PreparationMethod] = [
        cortar,
        picar,
        refogar,
        deglacear,
        picar
    ]
    
        
}
