//
//  EmojiMemoria.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 25/01/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    // Poderia alterar o nome model para memoria jogo, mas para demonstracao vou deixar model
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = Generate().generateRandomEmojis()
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Acess to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
}

struct Generate {
    // Função para gerar emojis aleatórios
    func generateRandomEmojis() -> [String] {
        let emojisHalloween = ["🎃","👻","🕷️","💀","🧟‍♀️","🧛🏻‍♂️","🕯️","🧙🏾‍♂️","🦇"]
        var uniqueEmojis: Set<String> = []
        let qtdeRandom = Int.random(in: 1...9)
        
        while uniqueEmojis.count <= qtdeRandom {
            let randomIndex = Int.random(in: 0..<emojisHalloween.count)
            let randomEmoji = emojisHalloween[randomIndex]
            uniqueEmojis.insert(randomEmoji)
        }
        
        return Array(uniqueEmojis)
    }
}
