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
