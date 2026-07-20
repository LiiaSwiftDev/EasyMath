//
//  OnboardingViewModelTests.swift
//  EasyMathTests
//
//  Created by Лия Кошеленко on 2026-07-18.
//

import XCTest
@testable import EasyMath

final class OnboardingViewModelTests: XCTestCase {

    func testAvatarHeight_whenIndexIsOne_returns88() {
        
        
        // 1. Given = Arrange
        let viewModel = OnboardingViewModel()
        let index = 1
        
        // 2. When = Act
        let height = viewModel.avatarHeight(index: index)
        
        // 3. Then = Assert
        XCTAssertEqual(height, 88)
        
    }
    
    func testAvatarHeight_whenIndexIsNotOne_returns95() {
        
        
        // 1. Given = Arrange
        let viewModel = OnboardingViewModel()
        let index = 9
        
        // 2. When = Act
        let height = viewModel.avatarHeight(index: index)
        
        // 3. Then = Assert
        XCTAssertEqual(height, 95)
        
    }
    
    func testSelectedIndexPlusOne() {
        
        // 1. Given
        let viewModel = OnboardingViewModel()
        viewModel.selectedIndex = 50
        
        // 2. When
        viewModel.goNext()
        
        // 3. Then
        XCTAssertEqual(viewModel.selectedIndex, 51)
        
    }

}
