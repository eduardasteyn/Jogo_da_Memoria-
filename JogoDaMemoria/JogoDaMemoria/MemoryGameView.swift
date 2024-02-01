//
//  ContentView.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 24/01/24.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(viewModel.cards) { card in
                    Cardview(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct Cardview: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        //GeometryReader { geometry in
        
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .frame(height: 100)
        .font(Font.system(size: 50))
        //.font(Font.system(size: fontSize(for: geometry.size))
        
        //}
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

#Preview {
    MemoryGameView(viewModel: EmojiMemoryGame())
}
