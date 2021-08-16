//
//  EmojiMemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is ViewModel (MVVM)

import SwiftUI



class EmojiMemoryGame {
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    
    static func createEmojiGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOFPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createEmojiGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
