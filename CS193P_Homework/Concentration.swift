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
    
    func updateCardStatus(at index: Int, isFaceUp: Bool) {
        if cards.indices.contains(index) {
            cards[index].isFaceUp = isFaceUp
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
