//
//  QuizViewModel.swift
//  EasyMath
//
//  Created by Лия Кошеленко on 2026-05-11.
//

import Foundation
import SwiftUI

@Observable
class QuizViewModel {
    
    // Current math example
    var example = ""
    
    // Numbers used in math example
    var a = 0
    var b = 0
    
    // Correct answer for current example
    var correctAnswer = ""
    
    // Answer options for quiz
    var quizOptions: [String] = []
    var quizExamples: [String] = []
    
    // Answer selected by user
    var selectedAnswer: String?
    
    // Check if selected answer is correct
    var answerIsCorrect: Bool = true
    
    // Show correсt/incorrect banner
    var showBanner = false
    
    // Quiz card selected by user
    var currentSign: QuizCardModel.Signs = .add
    
    // 1/10
    var progressIndicator = 1
    
    var correctAnswerCount = 0
    
    // Stores unique examples that were already generated
    var usedExamples = Set<String>()
    
    var showAnimation = false
    
    // Checkmark animation state
    var opacityCheckmark: CGFloat = 0
    var scale: CGFloat = 0
    var showCheckmarks = false
    
    // Example scale animation
    var scaleExample: CGFloat = 1
    
    // Controls firework animation trigger
    var trigger = false
    
    // Checkmark items for animation
    var checkmarks = [
        CheckmarkItem(imageName: "checkmark1", imageHeight: 50),
        CheckmarkItem(imageName: "checkmark1", imageHeight: 30),
        CheckmarkItem(imageName: "checkmark2", imageHeight: 15),
        CheckmarkItem(imageName: "checkmark1", imageHeight: 25),
        CheckmarkItem(imageName: "checkmark3", imageHeight: 30),
        CheckmarkItem(imageName: "checkmark3", imageHeight: 20),
        CheckmarkItem(imageName: "checkmark2", imageHeight: 20),
        CheckmarkItem(imageName: "checkmark3", imageHeight: 35),
        CheckmarkItem(imageName: "checkmark2", imageHeight: 20)
    ]
    
    // Positions for checkmark animation on the board
    var position = [
        (x: -20, y: 40),
        (x: 50, y: 30),
        (x: 20, y: 60),
        (x: 25, y: -30),
        (x: 90, y: -20),
        (x: 110, y: 20),
        (x: -90, y: 30),
        (x: -90, y: -20),
        (x: -30, y: -45)
    ]
    
    func multiplyExample() {
        repeat {
            a = Int.random(in: 1...10)
            b = Int.random(in: 1...10)
            
            // Generate multiplication example
            example = "\(a) x \(b) = ?"
            
            // Calculate correct answer
            correctAnswer = "\(a * b)"
            
            // Check if the generated example already exists. If it does, generate a new one
        } while usedExamples.contains(example)
        
        usedExamples.insert(example)
        
        // Stores unique answer options
        var answers = Set<String>()
        
        
        // Add correct answer as the first option
        answers.insert(correctAnswer)
        
        // Generating 3 wrong answers
        while answers.count < 4 {
            let wrong = "\(max(0, a * b + Int.random(in: -10...10)))"
            
            answers.insert(wrong)
        }
        
        // Converts them into arrays and shuffles them
        quizOptions = Array(answers).shuffled()
        
    }
    
    func additionExample() {
        repeat {
            a = Int.random(in: 1...20)
            b = Int.random(in: 1...20)
            
            // Generate addition example
            example = "\(a) + \(b) = ?"
            
            // Calculate correct answer
            correctAnswer = "\(a + b)"
            
            // Check if the generated example already exists. If it does, generate a new one
        } while usedExamples.contains(example)
        
        usedExamples.insert(example)
        
        // Stores unique answer options
        var answers = Set<String>()
        
        // Add correct answer as the first option
        answers.insert(correctAnswer)
        
        // Generating 3 wrong answers
        while answers.count < 4 {
            let wrong = "\(max(0, a + b + Int.random(in: -10...10)))"
            
            answers.insert(wrong)
        }
        
        // Converts them into arrays and shuffles them
        quizOptions = Array(answers).shuffled()
        
    }
    
    func subtractExample() {
        repeat {
            a = Int.random(in: 1...20)
            b = Int.random(in: 1...a)
            
            // Generate subtraction example
            example = "\(a) - \(b) = ?"
            
            // Calculate correct answer
            correctAnswer = "\(a - b)"
            
            // Check if the generated example already exists. If it does, generate a new one
        } while usedExamples.contains(example)
        
        usedExamples.insert(example)
        
        // Stores unique answer options
        var answers = Set<String>()
        
        // Add correct answer as the first option
        answers.insert(correctAnswer)
        
        // Generating 3 wrong answers
        while answers.count < 4 {
            let wrong = "\(max(0, a - b + Int.random(in: -5...5)))"
            
            answers.insert(wrong)
        }
        
        // Converts them into arrays and shuffles them
        quizOptions = Array(answers).shuffled()
        
    }
    
    func divideExample() {
        repeat {
            b = Int.random(in: 1...10)
            a = b * Int.random(in: 1...10)
            
            // Generate division example
            example = "\(a) ÷ \(b) = ?"
            
            // Calculate correct answer
            correctAnswer = "\(a / b)"
            
            // Check if the generated example already exists. If it does, generate a new one
        } while usedExamples.contains(example)
        
        usedExamples.insert(example)
        
        // Stores unique answer options
        var answers = Set<String>()
        
        // Add correct answer as the first option
        answers.insert(correctAnswer)
        
        // Generating 3 wrong answers
        while answers.count < 4 {
            let wrong = "\(max(0, a / b + Int.random(in: -5...5)))"
            
            answers.insert(wrong)
        }
        
        // Converts them into arrays and shuffles them
        quizOptions = Array(answers).shuffled()
        
    }
    
    // check if answer is correct and give feedback
    func checkAnswer() {
        
        if selectedAnswer == correctAnswer {
            answerIsCorrect = true
            correctAnswerCount += 1
            showAnimation.toggle()
        }
        else {
            answerIsCorrect = false
        }
        showBanner = true
    }
    
    func reset() {
        selectedAnswer = nil
        showBanner = false
        answerIsCorrect = true
    }
    
    func quizExample(sign: QuizCardModel.Signs) {
        
        // Reset previous example state
        reset()
        
        switch sign {
        case .multiply:
            multiplyExample()
        case .add:
            additionExample()
        case .subtrack:
            subtractExample()
        case .divide:
            divideExample()
        }
    }
    
    func animation() {
        
        withAnimation(.easeIn(duration: 0.2)) {
            opacityCheckmark = 1
            scale = 1.3
            showCheckmarks = true
        }
        
        withAnimation(.easeOut(duration: 0.2).delay(0.4)) {
            scale = 1
        }
    }
    
    func resetCheckmarkState() {
        withAnimation {
            scale = 0
            showCheckmarks = false
        }
    }
}
