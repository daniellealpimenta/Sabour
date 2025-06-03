//
//  Messages.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 26/05/25.
//

import Foundation

struct Messages {
    let title: String
    let message: String
    
    static let perfectMessages: [Messages] = [
        Messages(title: "Perfeito!", message: "Master Chef!"),
        Messages(title: "Perfeito!", message: "Gênio da Culinária!"),
        Messages(title: "Perfeito!", message: "Mestre Cuca!"),
        Messages(title: "Perfeito!", message: "3 Estrelas Michelin!"),
        Messages(title: "Incrível!", message: "Você arrasou!"),
        Messages(title: "Espetacular!", message: "Nota 10!"),
        Messages(title: "Sensacional!", message: "Que artista!"),
        Messages(title: "Magnífico!", message: "Divino!"),
        Messages(title: "UAU!", message: "Sem palavras!"),
    ]
    
    static let goodMessages: [Messages] = [
        Messages(title: "Excelente!", message: "Mandou muito bem!"),
        Messages(title: "Muito Bom!", message: "Prato delicioso!"),
        Messages(title: "Arrasou!", message: "Receita de sucesso!"),
        Messages(title: "Parabéns!", message: "Que sabor!"),
        Messages(title: "Ótimo!", message: "Aprovado!"),
    ]
    
    static let mediumMessages: [Messages] = [
        Messages(title: "Quase Lá!", message: "Faltou pouco!"),
        Messages(title: "Bom Trabalho!", message: "Continue cozinhando!"),
        Messages(title: "No Caminho Certo!", message: "Na próxima vai!"),
        Messages(title: "Tá Chegando Lá!", message: "Só um ajuste!"),
        Messages(title: "Mandou Bem!", message: "Quase 5 estrelas!"),
    ]
    
    static let badMessages: [Messages] = [
        Messages(title: "Opa!", message: "Tente de novo!"),
        Messages(title: "Faz Parte!", message: "Bora pra próxima!"),
        Messages(title: "Relaxa!", message: "Faz parte do aprendizado!"),
        Messages(title: "Na Próxima!", message: "Não desanima!"),
        Messages(title: "Uhm...", message: "Quase lá!"),
        Messages(title: "Deu Ruim!", message: "Ainda bem que tem delivery!"),
    ]
}
