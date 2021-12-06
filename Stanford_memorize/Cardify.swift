//
//  Cardify.swift
//  Stanford_memorize
//
//  Created by admin on 03.12.2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawningConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawningConstants.lineWidth)
            } else {
                shape.fill()
            }
// this bugfix for rotation animation
            content
                .opacity(isFaceUp ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/)
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
