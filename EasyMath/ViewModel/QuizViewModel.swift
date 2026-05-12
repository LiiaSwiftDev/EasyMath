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
    
    var example = ""
    var a = 0
    var b = 0
    var correctAnswer = ""
    var quizOptions: [String] = []
    
    
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
    
}
