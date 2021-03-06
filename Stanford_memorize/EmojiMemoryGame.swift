//
//  EmojiMemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is ViewModel (MVVM)

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛵","🚲","🛴","🏍","🛺","🚔","🚍","🚘","🚃","🚠","🚡","🚖","🚅","✈️","🛫","🛬","🛰","🚀","🛸","🚁","🛩","🛶","⛵️","🚤","🛥","🛳","⛴","🚢"]
    
    private static func createEmojiGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOFPairsOfCards: 12) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createEmojiGame()
    
    var cards: Array< Card> {
        model.cards
    }
    
    func choose(_ card: Card) {
//        objectWillChange.send()
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createEmojiGame()
    }
}
