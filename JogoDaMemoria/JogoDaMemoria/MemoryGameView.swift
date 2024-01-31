//
//  ContentView.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 24/01/24.
//

import SwiftUI

struct MemoryGameView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(viewModel.cards) { card in
                    Cardview(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
        }
        .font(Font.largeTitle)
        .padding()
        .foregroundColor(.orange)
    }
}

struct Cardview: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.frame(height: 100)
    }
}

#Preview {
    MemoryGameView(viewModel: EmojiMemoryGame())
}
