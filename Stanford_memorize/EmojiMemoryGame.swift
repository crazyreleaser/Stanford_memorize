//
//  EmojiMemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is ViewModel (MVVM)

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    
    private static func createEmojiGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOFPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createEmojiGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
         
        model.choose(card)
    }
}
