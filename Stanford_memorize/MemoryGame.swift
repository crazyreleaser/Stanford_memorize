//
//  MemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is the Model (MVVM)

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOFPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCrads x2 cards to cards array
        for pairIndex in 0..<numberOFPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var matched: Bool = false
        var content: CardContent
    }
}
