//
//  QuizViewModelTests.swift
//  EasyMathTests
//
//  Created by Лия Кошеленко on 2026-07-18.
//

import XCTest
@testable import EasyMath

final class QuizViewModelTests: XCTestCase {

    func testMultiplyExampleHasCorrectAnswer() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.multiplyExample()
        
        // 3. Assert
        // "Does the list of answers contain the correct answer?"
        XCTAssertTrue(viewModel.quizOptions.contains(viewModel.correctAnswer))
        
    }
    
    func testMultiplyExampleHasFourAnswers() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.multiplyExample()
        
        // 3. Assert
        XCTAssertEqual(viewModel.quizOptions.count, 4)
        
    }
    
    func testMultiplyExamplesIsUnique() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.multiplyExample()
        
        // 3. Assert
        XCTAssertEqual(Set(viewModel.quizOptions).count, 4)
        
    }
    
    func testMultiplSavedUsedExample() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.multiplyExample()
        
        // 3. Assert
        XCTAssertTrue(viewModel.usedExamples.contains(viewModel.example))
        
    }
    
    func testAdditionExampleHasCorrectAnswer() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.additionExample()
        
        // 3. Assert
        // "Does the list of answers contain the correct answer?"
        XCTAssertTrue(viewModel.quizOptions.contains(viewModel.correctAnswer))
        
    }
    
    func testAdditionExampleHasFourAnswers() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.additionExample()
        
        // 3. Assert
        XCTAssertEqual(viewModel.quizOptions.count, 4)
        
    }
    
    func testAdditionExamplesIsUnique() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.additionExample()
        
        // 3. Assert
        XCTAssertEqual(Set(viewModel.quizOptions).count, 4)
        
    }
    
    func testAdditionSavedUsedExample() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.additionExample()
        
        // 3. Assert
        XCTAssertTrue(viewModel.usedExamples.contains(viewModel.example))
        
    }
    
    func testSubtractExampleHasCorrectAnswer() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.subtractExample()
        
        // 3. Assert
        // "Does the list of answers contain the correct answer?"
        XCTAssertTrue(viewModel.quizOptions.contains(viewModel.correctAnswer))
        
    }
    
    func testSubtractExampleHasFourAnswers() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.subtractExample()
        
        // 3. Assert
        XCTAssertEqual(viewModel.quizOptions.count, 4)
        
    }
    
    func testSubtractExamplesIsUnique() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.subtractExample()
        
        // 3. Assert
        XCTAssertEqual(Set(viewModel.quizOptions).count, 4)
        
    }
    
    func testSubtractSavedUsedExample() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.subtractExample()
        
        // 3. Assert
        XCTAssertTrue(viewModel.usedExamples.contains(viewModel.example))
        
    }
    
    func testDivideExampleHasCorrectAnswer() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.divideExample()
        
        // 3. Assert
        // "Does the list of answers contain the correct answer?"
        XCTAssertTrue(viewModel.quizOptions.contains(viewModel.correctAnswer))
        
    }
    
    func testDivideExampleHasFourAnswers() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.divideExample()
        
        // 3. Assert
        XCTAssertEqual(viewModel.quizOptions.count, 4)
        
    }
    
    func testDivideExamplesIsUnique() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.divideExample()
        
        // 3. Assert
        XCTAssertEqual(Set(viewModel.quizOptions).count, 4)
        
    }
    
    func testDivideSavedUsedExample() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        
        // 2. Act
        viewModel.divideExample()
        
        // 3. Assert
        XCTAssertTrue(viewModel.usedExamples.contains(viewModel.example))
        
    }
    
    func testCheckIfSelectedAnswerIsCorrect() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        viewModel.selectedAnswer = "100"
        viewModel.correctAnswer = "100"
        viewModel.correctAnswerCount = 0
        
        // 2. Act
        viewModel.checkAnswer()
        
        // 3. Assert
        XCTAssertTrue(viewModel.answerIsCorrect)
        XCTAssertEqual(viewModel.correctAnswerCount, 1)
        XCTAssertTrue(viewModel.showAnimation)
        XCTAssertTrue(viewModel.showBanner)
        
    }
    
    func testCheckIfSelectedAnswerIsWrong() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        viewModel.selectedAnswer = "50"
        viewModel.correctAnswer = "60"
        viewModel.correctAnswerCount = 0
        
        // 2. Act
        viewModel.checkAnswer()
        
        // 3. Assert
        XCTAssertFalse(viewModel.answerIsCorrect)
        XCTAssertEqual(viewModel.correctAnswerCount, 0)
        XCTAssertTrue(viewModel.showBanner)
        
    }
    
    func testReset() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        viewModel.selectedAnswer = "26"
        viewModel.showBanner = true
        viewModel.answerIsCorrect = false
        
        // 2. Act
        viewModel.reset()
        
        // 3. Assert
        XCTAssertNil(viewModel.selectedAnswer)
        XCTAssertFalse(viewModel.showBanner)
        XCTAssertTrue(viewModel.answerIsCorrect)
        
    }
    
    func testQuizExampleAddition() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        let sign = QuizCardModel.Signs.add
        
        // 2. Act
        viewModel.quizExample(sign: sign)
        
        // 3. Assert
        XCTAssertTrue(viewModel.example.contains("+"))
        XCTAssertFalse(viewModel.correctAnswer.isEmpty)
        
    }
    
    func testQuizExampleSubtract() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        let sign = QuizCardModel.Signs.subtrack
        
        // 2. Act
        viewModel.quizExample(sign: sign)
        
        // 3. Assert
        XCTAssertTrue(viewModel.example.contains("-"))
        XCTAssertFalse(viewModel.correctAnswer.isEmpty)
        
    }
    
    func testQuizExampleMultiply() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        let sign = QuizCardModel.Signs.multiply
        
        // 2. Act
        viewModel.quizExample(sign: sign)
        
        // 3. Assert
        XCTAssertTrue(viewModel.example.contains("x"))
        XCTAssertFalse(viewModel.correctAnswer.isEmpty)
        
    }
    
    func testQuizExampleDivide() {
        
        // 1. Arrange
        let viewModel = QuizViewModel()
        let sign = QuizCardModel.Signs.divide
        
        // 2. Act
        viewModel.quizExample(sign: sign)
        
        // 3. Assert
        XCTAssertTrue(viewModel.example.contains("÷"))
        XCTAssertFalse(viewModel.correctAnswer.isEmpty)
        
    }

}
