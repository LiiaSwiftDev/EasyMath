//
//  ResultImageTests.swift
//  ResultImageTests
//
//  Created by Лия Кошеленко on 2026-07-18.
//

import XCTest
@testable import EasyMath

final class ResultViewModelTests: XCTestCase {

    func testSadResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let resultView = ResultViewModel()
        let score = 0
        
        // 2. When (Act) - Когда (Действие)
        let imageName = resultView.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-sad")
        
    }
    
    func testOkResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let resultView = ResultViewModel()
        let score = 5
        
        // 2. When (Act) - Когда (Действие)
        let imageName = resultView.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-ok")
        
    }
    
    func testSmileResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let resultView = ResultViewModel()
        let score = 10
        
        // 2. When (Act) - Когда (Действие)
        let imageName = resultView.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-smile")
        
    }
    
    func testDefaultResultImage() {
        
        // 1. Given (Arrange) - Дано (Подготовка)
        let resultView = ResultViewModel()
        let score = 12
        
        // 2. When (Act) - Когда (Действие)
        let imageName = resultView.resultImage(score: score)
        
        // 3. Then (Assert) - Тогда (Проверка результата)
        XCTAssertEqual(imageName, "lion-ok")
        
    }
    
}
