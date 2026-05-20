//
//  ResultViewModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-19.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class ResultViewModel {
    
    // Controls animation task lifecycle
    var animationTask: Task<Void, Never>?
    
    // Current result message shown in UI
    var text = ""
    
    let lowScoreMessages = [
        "Try Again!",
        "Don’t Give Up!",
        "Almost There!",
        "Keep Practicing!",
        "Nice Try!",
        "So Close!",
        "Let’s Try Again!",
        "Keep Going!",
        "You’re Learning!",
        "Practice Makes Perfect!"
    ]
    
    let mediumScoreMessages = [
        "Good Job!",
        "Nice Work!",
        "Well Done!",
        "Great Try!",
        "Good Thinking!",
        "Smart Choice!",
        "Keep It Up!",
        "Awesome!",
        "Wonderful!",
        "You Rock!"
    ]
    
    let highScoreMessages = [
        "Excellent!",
        "Perfect!",
        "Amazing Work!",
        "Fantastic!",
        "Brilliant!",
        "Outstanding!",
        "Super Smart!",
        "Math Master!",
        "Mission Complete!",
        "You Did It!"
    ]
    
    // Update user score in SwiftData
    func increaseScore(scores: [Score], correctAnswer: Int, context: ModelContext) async {
        
        // Cancel previous task if exists
        animationTask?.cancel()
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        await MainActor.run {
            if let existingScore = scores.first {
                existingScore.score += correctAnswer
                
                try? context.save()
                
            }
            else {
                let scoreBagde = Score()
                scoreBagde.score = correctAnswer
                context.insert(scoreBagde)
                
                try? context.save()
            }
        }
        
    }
    
    // Returns message based on final score
    func resultMessage(score: Int) -> String {
        switch score {
        case 0...3:
            return lowScoreMessages.randomElement() ?? "Try Again!"
        case 4...6:
            return mediumScoreMessages.randomElement() ?? "Good Job!"
        case 7...10:
            return highScoreMessages.randomElement() ?? "Excellent!"
        default:
            return "Keep Going!"
        }
    }
    
    // Returns image name based on score
    func resultImage(score: Int) -> String {
        switch score {
        case 0...3:
            return "lion-sad"
        case 4...6:
            return "lion-ok"
        case 7...10:
            return "lion-smile"
        default:
            return "lion-ok"
        }
    }
    
    // Updates UI text with result message
    func feedbackText(correct: Int) {
        text = resultMessage(score: correct)
    }
    
}
