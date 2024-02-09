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
        VStack {
            Grid(viewModel.cards) { card in
                Cardview(card: card).onTapGesture {
                    withAnimation(.linear(duration: durationAnimation)) {
                        viewModel.choose(card: card)
                    }
                   
                }
                .padding(5) // pensar
            }
            .padding()
            .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            }, label: { Text("Novo Jogo") })
        }
    }
    
    // MARK: - Drawing Constants
    private let durationAnimation: CGFloat = 0.75
}

struct Cardview: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
        
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(starAngle, endAngle(bonusRemaining: animatedBonusRemaining), clockwise: true)
                            .onAppear {
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(starAngle, endAngle(bonusRemaining: card.bonusRemaining), clockwise: true)
                    }
                }
                .padding(padding).opacity(opacity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(rotationAngle(card.isMatched))
                    .animation(card.isMatched ? Animation.linear(duration: duration).repeatForever(autoreverses: false) : .default)
                
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    
    // MARK: - Drawing Constants
    private let starAngle = Angle.degrees(0-90)

    private let padding: CGFloat = 5
    private let opacity: CGFloat = 0.4
    private let duration: CGFloat = 1
    
    private func endAngle(bonusRemaining: Double) -> Angle {
        Angle.degrees(-bonusRemaining*360-90)
    }
    
    private func rotationAngle(_ isMatched: Bool) -> Angle {
        Angle.degrees(isMatched ? 360 : 0)
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

#Preview {
    MemoryGameView(viewModel: EmojiMemoryGame())
}
