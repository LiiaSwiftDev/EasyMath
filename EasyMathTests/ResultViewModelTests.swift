//
//  ResultImageTests.swift
//  ResultImageTests
//
//  Created by Лия Кошеленко on 2026-07-18.
//

import XCTest
@testable import EasyMath
import SwiftData

final class ResultViewModelTests: XCTestCase {

    func testSadResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let viewModel = ResultViewModel()
        let score = 0
        
        // 2. When (Act) - Когда (Действие)
        let imageName = viewModel.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-sad")
        
    }
    
    func testOkResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let viewModel = ResultViewModel()
        let score = 5
        
        // 2. When (Act) - Когда (Действие)
        let imageName = viewModel.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-ok")
        
    }
    
    func testSmileResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let viewModel = ResultViewModel()
        let score = 10
        
        // 2. When (Act) - Когда (Действие)
        let imageName = viewModel.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-smile")
        
    }
    
    func testDefaultResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let viewModel = ResultViewModel()
        let score = 12
        
        // 2. When (Act) - Когда (Действие)
        let imageName = viewModel.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-ok")
        
    }
    
    func testResultNessageLowScore() {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let score = 1
        
        // 2. When (Act)
        let message = viewModel.resultMessage(score: score)
        
        // 3. Then (Result)
        XCTAssertTrue(viewModel.lowScoreMessages.contains(message))
        
    }
    
    func testResultNessageMediumScore() {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let score = 6
        
        // 2. When (Act)
        let message = viewModel.resultMessage(score: score)
        
        // 3. Then (Result)
        XCTAssertTrue(viewModel.mediumScoreMessages.contains(message))
        
    }
    
    func testResultNessageHighScore() {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let score = 10
        
        // 2. When (Act)
        let message = viewModel.resultMessage(score: score)
        
        // 3. Then (Result)
        XCTAssertTrue(viewModel.highScoreMessages.contains(message))
        
    }
    
    func testResultNessageDefaultScore() {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let score = -12
        
        // 2. When (Act)
        let message = viewModel.resultMessage(score: score)
        
        // 3. Then (Result)
        XCTAssertEqual(message, "Keep Going!")
        
    }
    
    @MainActor
    func testIncreaseExistingScore() async {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let answer = 10
        let score = Score()
        score.score = 0
        let container = try! ModelContainer(for: Score.self)
        let context = container.mainContext
        
        
        // 2. When (Act)
        await viewModel.increaseScore(scores: [score], correctAnswer: answer, context: context)

        
        // 3. Then (Result)
        XCTAssertEqual(score.score, 10)
        
    }
    
    @MainActor
    func testIncreaseNilScore() async {
        
        // 1. Given (Assert)
        let viewModel = ResultViewModel()
        let answer = 6
        
        let container = try! ModelContainer(for: Score.self)
        let context = container.mainContext
        
        
        // 2. When (Act)
        await viewModel.increaseScore(scores: [], correctAnswer: answer, context: context)

        
        // 3. Then (Result)
        let scores = try! context.fetch(FetchDescriptor<Score>())
        
        XCTAssertEqual(scores.first?.score, 6)
        
    }
    
}
