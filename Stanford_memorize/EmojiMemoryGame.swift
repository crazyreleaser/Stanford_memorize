//
//  EmojiMemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is ViewModel (MVVM)

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "smile"
}

class EmojiMemoryGame {
    // This is swift extremly simplify the code thats may cause some missunderstanding
    
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4, createCardContent: makeCardContent)
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4, createCardContent: (index: Int) -> String {
//        return "smile"
//    })
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4, createCardContent: { index in
//        return "smile"
//    })
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4, createCardContent: { index in "smile" })
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4) { index in "smile" }
    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4) { _ in "smile" }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
