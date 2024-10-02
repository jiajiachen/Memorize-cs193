//
//  Project1App.swift
//  Project1
//
//  Created by Kelly Chen on 2024/8/5.
//

import SwiftUI

@main
struct Project1App: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
