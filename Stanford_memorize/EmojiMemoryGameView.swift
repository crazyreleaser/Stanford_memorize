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
                Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 20))
                    .padding(4).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
// rotates only one card of two - animation animate ONLY WHAT CHANGES, but on second card isMtached didnt changed
// we shoud change some View so text would be there permanent - see cardify
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawningConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.height, size.width) / (DrawningConstants.fontSize / DrawningConstants.fontScale)
    }
    
    private struct DrawningConstants {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 32
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


