//
//  Cardify.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 06/02/24.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var rotation: Double
    var isFaceUp: Bool {
        rotation < angle
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue}
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
                .opacity(opacity(isFaceUp, isBefore: true))
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(opacity(isFaceUp, isBefore: false))
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: axis)

    }

    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let angle: Double = 90
    private let axis: (x: CGFloat, y: CGFloat, z: CGFloat) = (0,1,0)
    
    private func opacity(_ isFaceUp: Bool, isBefore: Bool) -> CGFloat {
        isBefore ? isFaceUp ? 1 : 0 : isFaceUp ? 0 : 1
    }

    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
