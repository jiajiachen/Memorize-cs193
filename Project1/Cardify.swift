//
//  Cardify.swift
//  Project1
//
//  Created by Kelly Chen on 2024/10/3.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius
            )
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.foregroundStyle(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0) // 有很多种写法，这一句也可以不写，这一句与下一句有上下关系。
            base.fill()
                .opacity(isFaceUp ? 0 : 1) // 相当于mask 蒙板
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
