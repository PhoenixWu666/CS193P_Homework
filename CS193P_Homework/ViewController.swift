//
//  ViewController.swift
//  CS193P_Homework
//
//  Created by Phoenix Wu on H30/04/02.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: getPairCount())
    
    var theme = ThemeFactory.getTheme(themeEnum: .Halloween)
    
    @IBAction func touchCard(_ sender: UIButton) {
        //
    }
    
    func getPairCount() -> Int {
        let cardCount = cardButtons.count
        
        return cardCount % 2 == 0 ? cardCount / 2 : (cardCount + 1) / 2
    }
    
}

