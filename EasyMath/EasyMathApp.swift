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
    @State var quizModel = QuizViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
            // Pass model to all child views
                .environment(model)
                .environment(quizModel)
        }
    }
}
