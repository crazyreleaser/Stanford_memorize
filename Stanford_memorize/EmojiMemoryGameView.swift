//
//  EmojiMemoryGameView.swift
//  Stanford_memorize
//
//  Created by admin on 06.08.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
//    var emojisFruit = ["🍏","🍎","🍐","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶"]
//    var emojisSport = ["⚽️","🏀","🏈","🥎","🏉","🥏","🎱","🏓","🪃","🏒","🏹","🪁","🥊","🛼","🛹","🥋","🛷","⛸","⛷","🏂","🪂","🏄‍♂️","🚣‍♀️"]
//    var emojisVehicles = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
//
//    @State var currentEmojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(.purple)
            .padding(.horizontal)
        }
        
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawningConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawningConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 20))
                        .padding(4).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0.3)
                }
                else {
                    shape.fill()
                }
            }
            
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawningConstants.fontScale)
    }
    
    private struct DrawningConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 2
        static let fontScale: CGFloat = 0.65
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
    }
}


