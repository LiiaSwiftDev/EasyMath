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
            example = "\(a) : \(b) = ?"
            
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
        // сбрасывает предыдущий пример
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
    
}
