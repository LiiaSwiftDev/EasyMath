//
//  EasyMathApp.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI

@main
struct EasyMathApp: App {
    
    // Stores app state
    @State var model = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Pass model to all child views
                .environment(model)
        }
    }
}
