//
//  MainViewModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-04-28.
//

import Foundation
import SwiftUI

@Observable
class MainViewModel {
    
    // Phrases for typing animation in content view
    var phrases = [
        "Ready?",
        "Let’s play!",
    ]
    
    // Current phrase index
    var currentIndex = 0
    // Text displayed in chat bubble
    var displayedText = ""
    // Task for controlling typing animation
    var animationTask: Task<Void, Never>?
    
    // Quiz cards data
    var cards: [QuizCardModel] = [
        QuizCardModel(
            bg: Color(red: 97/255, green: 116/255, blue: 177/255),
            shadowBg: Color(red: 125/255, green: 144/255, blue: 189/255),
            footer: Color(red: 81/255, green: 98/255, blue: 155/255),
            text: "Divide",
            number1: "9",
            number2: "3",
            circleColor: Color(red: 54/255, green: 69/255, blue: 111/255),
            image: "fish",
            imagePlace: "reef",
            padding: 90,
            shadowButton: Color(red: 58/255, green: 71/255, blue: 106/255),
            scaleAnimal: 39.0,
            scalePlace: 54.0,
            signs: .divide),
        
        
        QuizCardModel(
            bg: Color(red: 243/255, green: 93/255, blue: 92/255),
            shadowBg: Color(red: 244/255, green: 124/255, blue: 121/255),
            footer: Color(red: 219/255, green: 76/255, blue: 77/255),
            text: "Subtrack",
            number1: "7",
            number2: "5",
            circleColor: Color(red: 187/255, green: 49/255, blue: 52/255),
            image: "parrot",
            imagePlace: "island",
            padding: 80,
            shadowButton: Color(red: 174/255, green: 57/255, blue: 59/255),
            scaleAnimal: 43.0,
            scalePlace: 62.0,
            signs: .subtrack),
        
        QuizCardModel(
            bg: Color(red: 255/255, green: 210/255, blue: 100/255),
            shadowBg: Color(red: 244/255, green: 177/255, blue: 74/255),
            footer: Color(red: 234/255, green: 148/255, blue: 40/255),
            text: "Add",
            number1: "2",
            number2: "4",
            circleColor: Color(red: 255/255, green: 183/255, blue: 44/255),
            image: "camel",
            imagePlace: "desert",
            padding: 65,
            shadowButton: Color(red: 181/255, green: 109/255, blue: 29/255),
            scaleAnimal: 37.0,
            scalePlace: 56.0,
            signs: .add),
        
        QuizCardModel(
            bg: Color(red: 137/255, green: 195/255, blue: 116/255),
            shadowBg: Color(red: 146/255, green: 184/255, blue: 125/255),
            footer: Color(red: 106/255, green: 157/255, blue: 86/255),
            text: "Multiply",
            number1: "8",
            number2: "6",
            circleColor: Color(red: 113/255, green: 178/255, blue: 90/255),
            image: "chicken",
            imagePlace: "farm",
            padding: 80,
            shadowButton: Color(red: 82/255, green: 123/255, blue: 63/255),
            scaleAnimal: 36.0,
            scalePlace: 58.0,
            signs: .multiply)
        
    ]
    // Animation for chat bubble in content view
    func typingAnimationLoop() {
        
        // Cancel previous task if exists
        animationTask?.cancel()
        
        // Start new animation task
        animationTask = Task {
            
            // Repeat until task is cancelled
            while !Task.isCancelled {
                
                let text = phrases[currentIndex]
                
                // Toggle between phrases
                currentIndex = (currentIndex == 0) ? 1 : 0
                
                await MainActor.run {
                    // Clear text on main thread
                    displayedText = ""
                }
                
                // Speed of typing
                let speed: Double = 0.08
                
                // Type each letter
                for letter in text {
                    
                    try? await Task.sleep(
                        nanoseconds: UInt64(speed * 1_000_000_000)
                    )
                    
                    // Stop if task was cancelled
                    guard !Task.isCancelled else { return }
                    
                    await MainActor.run {
                        displayedText.append(letter)
                    }
                }
                
                // Wait before next phrase
                try? await Task.sleep(nanoseconds: 5_000_000_000)
            }
        }
    }
}
