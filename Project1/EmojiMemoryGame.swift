//
//  EmojiMemoryGame.swift
//  Project1
//
//  Created by Kelly Chen on 2024/10/1.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻", "🎃","🕷️","😈", "💀", "🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return  emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
                
        }
    }
    
    @Published private var model = createMemoryGame()
 

    var cards: Array<Card> {
        return model.cards
    }
    
    var card: Array<Card>
    {
        model.cards
    }
    
    var color: Color
    {
        .orange
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card:Card) {
        model.choose(card: card)
    }
    
}
