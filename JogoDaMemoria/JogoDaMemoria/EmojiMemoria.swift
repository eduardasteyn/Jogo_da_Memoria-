//
//  EmojiMemoria.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 25/01/24.
//

import SwiftUI


class EmojiMemoria {
    // Poderia alterar o nome model para memoria jogo, mas para demonstracao vou deixar model
    private var model: Memoria<String> = EmojiMemoria.createMemoryGame()
    
    static func createMemoryGame() -> Memoria<String> {
        let emojis = ["🎃","👻","🕷️"]
        return Memoria<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }

    }
    
    // MARK: - Acess to the Model
    
    var cards: Array<Memoria<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: Memoria<String>.Card) {
        model.choose(card: card)
    }
    
}
