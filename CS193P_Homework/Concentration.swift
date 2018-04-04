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
        
        for _ in 0..<numberOfPairsOfCards {
            tempCards.append(cards[(cards.count - 1).arc4random])
        }
        
        cards = tempCards
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
