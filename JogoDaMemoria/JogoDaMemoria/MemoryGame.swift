//
//  Memoria.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 25/01/24.
//

import SwiftUI

// Para utilizar minha model Memoria devo dizer qual tipo vou usar para atribuir ao meu CardContent que é um tipo genérico
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card escolhido: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContenteFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContenteFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
