//
//  MemoryGame.swift
//  Stanford_memorize
//
//  Created by admin on 16.08.2021.
//
// This is the Model (MVVM)

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
//            let faceUpIndices = cards.indices.filter({ index in cards[index].isFaceUp })
//            let faceUpIndices = cards.indices.filter({ cards[$0].isFaceUp })
//            var faceUpIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpIndices.append(index)
//                }
//            }
//            return faceUpIndices.oneAndOnly     // see extension in the end
//            if faceUpIndices.count ==  1 {
//                return faceUpIndices.first   // can return nil if empty
//            } else {
//                return nil
//            }
            cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
//                if index != newValue {
//                    cards[index].isFaceUp = false
//                } else {
//                    cards[index].isFaceUp = true
//                }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
                        
        }
        print("Choden card: \(cards)")
    }
        
    init(numberOFPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []  // we say above that this is Array of card, no need do it twice 
        // add numberOfPairsOfCrads x2 cards to cards array
        for pairIndex in 0..<numberOFPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
//        if self.count ==  1 {
        if count ==  1 {
//            return self.first   // can return nil if empty
            return first   // can return nil if empty
        } else {
            return nil
        }
    }
}
