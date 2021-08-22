//
//  Stanford_memorizeApp.swift
//  Stanford_memorize
//
//  Created by admin on 06.08.2021.
//

import SwiftUI

@main
struct Stanford_memorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
