//
//  EasyMathApp.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-22.
//

import SwiftUI
import SwiftData

@main
struct EasyMathApp: App {
    
    // Stores app state
    @State var model = MainViewModel()
    @State var quizModel = QuizViewModel()
    @State var resultModel = ResultViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
            // Pass model to all child views
                .environment(model)
                .environment(quizModel)
                .environment(resultModel)
                .modelContainer(for: Score.self)
        }
    }
}
