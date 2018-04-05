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
    
    lazy var game = Concentration(numberOfPairsOfCards: self.numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        let cardCount = cardButtons.count
        
        return cardCount % 2 == 0 ? cardCount / 2 : (cardCount + 1) / 2
    }
    
    var theme = ThemeFactory.getTheme(themeEnum: .Halloween)
    
    lazy var emojiSet = theme.getEmojiSet()
    
    var emojiDictionary = [Int : String]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender) {
            if !game.cards[index].isFaceUp {
                flipCard(cardButton: sender, backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), title: getEmoji(game.cards[index].identifier))
                game.updateCardStatus(at: index, isFaceUp: true)
            } else {
                flipCardBack(cardButton: sender)
                game.updateCardStatus(at: index, isFaceUp: false)
            }
        }
    }
    
    private func flipCardBack(cardButton: UIButton) {
        flipCard(cardButton: cardButton, backgroundColor: #colorLiteral(red: 0.9994830489, green: 0.6620230675, blue: 0.1431986988, alpha: 1), title: "")
    }
    
    private func flipCard(cardButton: UIButton, backgroundColor: UIColor, title: String) {
        cardButton.setTitle(title, for: .normal)
        cardButton.backgroundColor = backgroundColor
    }
    
    func getEmoji(_ at: Int) -> String {
        if emojiDictionary[at] == nil, emojiSet.count > 0 {
            let index = emojiSet.index(emojiSet.startIndex, offsetBy: emojiSet.count.arc4random)
            emojiDictionary[at] = String(emojiSet.remove(at: index))
        }
        
        return emojiDictionary[at] ?? "?"
    }
    
}

