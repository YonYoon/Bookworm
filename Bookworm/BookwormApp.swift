//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Zhansen Zhalel on 03.01.2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
