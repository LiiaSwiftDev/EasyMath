//
//  MainViewModelTests.swift
//  EasyMathTests
//
//  Created by Лия Кошеленко on 2026-07-18.
//

import XCTest
@testable import EasyMath

final class MainViewModelTests: XCTestCase {

    func testLimitCharOverLimit() {
        
        // 1. Diven
        let viewModel = MainViewModel()
        let input = "LiiaKoshelenko"
        let limit = 4
        
        // 2. When
        let result = viewModel.limitChar(input: String(input), limit: limit)
        
        // 3. Then
        XCTAssertEqual(result, "Liia")
        
    }
    
    func testLimitCharBeforeLimit() {
        
        // 1. Diven
        let viewModel = MainViewModel()
        let input = "Kiki"
        let limit = 10
        
        // 2. When
        let result = viewModel.limitChar(input: String(input), limit: limit)
        
        // 3. Then
        XCTAssertEqual(result, "Kiki")
        
    }
    
    func testIndexLessThanCharacter() {
        
        // 1. Diven
        let viewModel = MainViewModel()
        let index = 5
        viewModel.name = "Jordan"
        
        // 2. When
        let result = viewModel.character(at: index)
        
        // 3. Then
        XCTAssertEqual(result, "n")
        
    }
    
    func testIndexMoreThanCharacter() {
        
        // 1. Diven
        let viewModel = MainViewModel()
        let index = 5
        viewModel.name = "Liia"
        
        // 2. When
        let result = viewModel.character(at: index)
        
        // 3. Then
        XCTAssertEqual(result, "")
        
    }
    
    func testIndexEqualZeroCharacter() {
        
        // 1. Diven
        let viewModel = MainViewModel()
        let index = 0
        viewModel.name = "Liia"
        
        // 2. When
        let result = viewModel.character(at: index)
        
        // 3. Then
        XCTAssertEqual(result, "L")
        
    }
    
    func testUpdateIsCursosAtTheEnd() {
        
        // 1. Given
        let viewModel = MainViewModel()
        viewModel.name = "Alexandra"
        
        // 2. When
         viewModel.updateIsCursorAtEnd()
        
        // 3. Then
        XCTAssertTrue(viewModel.isCursorAtEnd)
        
    }
    
    func testUpdateIsCursosIsNotAtTheEnd() {
        
        // 1. Given
        let viewModel = MainViewModel()
        viewModel.name = "Liia"
        
        // 2. When
         viewModel.updateIsCursorAtEnd()
        
        // 3. Then
        XCTAssertFalse(viewModel.isCursorAtEnd)
        
    }
    
    func testCompactNumberOver1000() {
        
        // 1. Arrange
        let viewModel = MainViewModel()
        let score = 5200
        
        // 2. Act
        let result = viewModel.compactNumber(score: score)
        
        // 3. Assert
        XCTAssertEqual(result, "5k")
        
    }

    func testCompactNumberBefore1000() {
        
        // 1. Arrange
        let viewModel = MainViewModel()
        let score = 66
        
        // 2. Act
        let result = viewModel.compactNumber(score: score)
        
        // 3. Assert
        XCTAssertEqual(result, "66")
        
    }
    
    func testCompactNumberEqual1000() {
        
        // 1. Arrange
        let viewModel = MainViewModel()
        let score = 1000
        
        // 2. Act
        let result = viewModel.compactNumber(score: score)
        
        // 3. Assert
        XCTAssertEqual(result, "1k")
        
    }
    
    
}
