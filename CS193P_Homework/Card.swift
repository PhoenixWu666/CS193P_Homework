//
//  Card.swift
//  CS193P_Homework
//
//  Created by Phoenix Wu on H30/04/02.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import Foundation

struct Card {
    
    var isMatched = false
    
    var isFaceUp = false
    
    private static var identifierFactory = 0
    
    private static func getIdentifier() -> Int {
        identifierFactory += 1
        
        return identifierFactory
    }
    
    private(set) var identifier: Int
    
    init() {
        identifier = Card.getIdentifier()
    }
    
    
}
