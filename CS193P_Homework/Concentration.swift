//
//  Concentration.swift
//  CS193P_Homework
//
//  Created by Phoenix Wu on H30/04/02.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfSingleFlipedCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // shuffle cards
        var tempCards = [Card]()
        let count = cards.count
        
        for _ in 0..<count {
            tempCards.append(cards.remove(at: (cards.count - 1).arc4random))
        }
        
        cards = tempCards
    }
    
    func chooseCard(at index: Int, isFaceUp: Bool) {
        if cards.indices.contains(index) {
            cards[index].isFaceUp = isFaceUp
            
            if isFaceUp {
                // one card had been fliped on before
                if let matchIndex = indexOfSingleFlipedCard, index != matchIndex {
                    if cards[index].identifier == cards[matchIndex].identifier {
                        // match
                        cards[index].isMatched = true
                        cards[matchIndex].isMatched = true
                        indexOfSingleFlipedCard = nil
                    } else {
                        // mismatch
                        cards[matchIndex].isFaceUp = false
                        indexOfSingleFlipedCard = index
                    }
                } else {
                    // only card is fliped on
                    indexOfSingleFlipedCard = index
                }
            } else {
                // flip back, so just keep previous card which is fliped on if it exists
                var flipedOnIndex: Int? = nil
                
                for cardIndex in 0..<cards.count {
                    if cards[cardIndex].isFaceUp, !cards[cardIndex].isMatched {
                        flipedOnIndex = cardIndex
                    }
                }
                
                indexOfSingleFlipedCard = flipedOnIndex
            }
        }
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
