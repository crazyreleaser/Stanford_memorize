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
    private var model: MemoryGame<String> = MemoryGame<String>(numberOFPairsOfCards: 4, createCardContent: makeCardContent)
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
