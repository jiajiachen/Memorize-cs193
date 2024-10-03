//
//  CardView.swift
//  Project1
//
//  Created by Kelly Chen on 2024/10/3.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0) // 有很多种写法，这一句也可以不写，这一句与下一句有上下关系。
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1) // 相当于mask 蒙板
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    typealias Card = MemoryGame<String>.Card
   return CardView(Card(content: "X", id: "test1"))
        .padding()
        .foregroundStyle(.green)
}
