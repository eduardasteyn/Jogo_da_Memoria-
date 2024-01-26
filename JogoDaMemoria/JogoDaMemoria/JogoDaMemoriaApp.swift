//
//  JogoDaMemoriaApp.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 24/01/24.
//

import SwiftUI

@main
struct JogoDaMemoriaApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoria()
            ContentView(viewModel: game)
        }
    }
}
