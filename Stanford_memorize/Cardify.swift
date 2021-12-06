//
//  Cardify.swift
//  Stanford_memorize
//
//  Created by admin on 03.12.2021.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // angle in degrees of rotation
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawningConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawningConstants.lineWidth)
            } else {
                shape.fill()
            }
// this bugfix for rotation animation
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1 , 0))
    }
    
    
    private struct DrawningConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 2
    }
    
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp ))
    }
}
