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
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                    ForEach(game.cards ) { card in
            AspectVGrid(items: game.cards, aspect: 2/3, content: { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            })
                        
//                    }
//                }
//            }
            .foregroundColor(.purple)
        }
        .padding(.horizontal)
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
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 4
        static let fontScale: CGFloat = 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}


