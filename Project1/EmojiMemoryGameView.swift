//
//  EmojiMemoryGameView.swift
//  Project1
//
//  Created by Kelly Chen on 2024/8/5.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    let emojis = ["👻", "🎃","🕷️","😈", "💀", "🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundStyle(.orange)
    }
    
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0) // 有很多种写法，这一句也可以不写，这一句与下一句有上下关系。
            base.fill().opacity(isFaceUp ? 0 : 1) // 相当于mask 蒙板
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
