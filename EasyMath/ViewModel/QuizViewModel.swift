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
    
    // Answer selected by user
    var selectedAnswer: String?
    
    // Check if selected answer is correct
    var answerIsCorrect: Bool = true
    
    // Show correсt/incorrect banner
    var showBanner = false
    
    
    func multiplyExample() {
        a = Int.random(in: 1...10)
        b = Int.random(in: 1...10)
        
        // пример
        example = "\(a) x \(b) = ?"
        // ответ
        correctAnswer = "\(a * b)"
        
        // хранит уникальные значений
        var answers = Set<String>()
        
        // добавляем 1 вариант - правильный ответ
        answers.insert(correctAnswer)
        
        // Пока количество ответов меньше 4 — выполняй код
        while answers.count < 4 {
            let wrong = "\(max(0, a * b + Int.random(in: -10...10)))"
            
            // добавляем варианты ответа к answers
            answers.insert(wrong)
        }
        
        // Array(answers) - превразаем его в массив чтобы появился стабильный порядок
        quizOptions = Array(answers).shuffled()
        
    }
    
    func additionExample() {
        a = Int.random(in: 1...20)
        b = Int.random(in: 1...20)
        
        // пример
        example = "\(a) + \(b) = ?"
        // ответ
        correctAnswer = "\(a + b)"
        
        // хранит уникальные значений
        var answers = Set<String>()
        
        // добавляем 1 вариант - правильный ответ
        answers.insert(correctAnswer)
        
        // Пока количество ответов меньше 4 — выполняй код
        while answers.count < 4 {
            let wrong = "\(max(0, a + b + Int.random(in: -10...10)))"
            
            // добавляем варианты ответа к answers
            answers.insert(wrong)
        }
        
        // Array(answers) - превразаем его в массив чтобы появился стабильный порядок
        quizOptions = Array(answers).shuffled()
        
    }
    
    func subtractExample() {
        a = Int.random(in: 1...20)
        b = Int.random(in: 1...a)
        
        
        // пример
        example = "\(a) - \(b) = ?"
        // ответ
        correctAnswer = "\(a - b)"
        
        // хранит уникальные значений
        var answers = Set<String>()
        
        // добавляем 1 вариант - правильный ответ
        answers.insert(correctAnswer)
        
        // Пока количество ответов меньше 4 — выполняй код
        while answers.count < 4 {
            let wrong = "\(max(0, a - b + Int.random(in: -5...5)))"
            
            // добавляем варианты ответа к answers
            answers.insert(wrong)
        }
        
        // Array(answers) - превразаем его в массив чтобы появился стабильный порядок
        quizOptions = Array(answers).shuffled()
        
    }
    
    func divideExample() {
        b = Int.random(in: 1...10)
        a = b * Int.random(in: 1...10)
        
        
        // пример
        example = "\(a) : \(b) = ?"
        // ответ
        correctAnswer = "\(a / b)"
        
        // хранит уникальные значений
        var answers = Set<String>()
        
        // добавляем 1 вариант - правильный ответ
        answers.insert(correctAnswer)
        
        // Пока количество ответов меньше 4 — выполняй код
        while answers.count < 4 {
            let wrong = "\(max(0, a / b + Int.random(in: -5...5)))"
            
            // добавляем варианты ответа к answers
            answers.insert(wrong)
        }
        
        // Array(answers) - превразаем его в массив чтобы появился стабильный порядок
        quizOptions = Array(answers).shuffled()
        
    }
    
    // check if answer is correct and give feedback
    func checkAnswer() {
        
        if selectedAnswer == correctAnswer {
            answerIsCorrect = true
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
     
}
