//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    // test_addition_success
    func testWhenAddAnumberPlusAnotherNumberThenExpressionShouldUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "2")
        calculator.addition()
        calculator.tappedNumber(numberText: "3")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertEqual(calculator.resultString, "5")
    }
    
    // test_addition_failed
    func testWhenAddAnumberPlusAnotherNumberThenExpressionShouldNotUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "2")
        calculator.addition()
        calculator.tappedNumber(numberText: "3")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.resultString == "6")
    }
    
    // test_substraction_success
    func testWhenAddAnumberMinusAnotherNumberThenExpressionShouldUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "5.8")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertEqual(calculator.resultString, "2.80")
    }
    
    // test_substraction_failed
    func testWhenAddAnumberMinusAnotherNumberThenExpressionShouldNotUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "2.5")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.resultString == "-2.50")
    }
    
    // test_multiplication_success
    func testWhenAddAnumberMultiplicatedByAnotherNumberThenExpressionShouldUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "6")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "4")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertEqual(calculator.resultString, "24")
    }
    
    // test_multiplication_failed
    func testWhenAddAnumberMultiplicatedByAnotherNumberThenExpressionShouldNotUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "7")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "1")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.resultString == "8")
    }
    
    // test_division_success
    func testWhenAddAnumberDividedByAnotherNumberThenExpressionShouldUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "5")
        calculator.division()
        calculator.tappedNumber(numberText: "2")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertEqual(calculator.resultString, "2.50")
    }
    
    // test_division_failed
    func testWhenAddAnumberDividedByAnotherNumberThenExpressionShouldNotUpdate() {
        // GIVEN
        calculator.tappedNumber(numberText: "10")
        calculator.division()
        calculator.tappedNumber(numberText: "2")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.resultString == "6")
    }
    
    func testIfExpressionIsCorrect() {
        // GIVEN
        calculator.tappedNumber(numberText: "2")
        calculator.tappedNumber(numberText: "+")
        calculator.tappedNumber(numberText: "1")
        
        // THEN
        XCTAssertTrue(calculator.expressionIsCorrect)
    }
    
    func testIfExpressionHaveEnoughElement() { // add
        // GIVEN
        calculator.tappedNumber(numberText: "2 - 6")

        // THEN
        XCTAssertTrue(calculator.expressionHaveEnoughElement)
    }
    
    func test_if_expression_is_correct_error_with_addition_operator() {
        // GIVEN
        calculator.tappedNumber(numberText: "+")
        
        // THEN
        XCTAssertFalse(calculator.expressionIsCorrect)
    }
    
    func test_expression_have_enough_element_success() {
        // GIVEN
        calculator.calculationText = "2 + 1 = 3"
        
        // THEN
        XCTAssertTrue(calculator.expressionHaveResult)
    }
    
    func test_expression_have_enough_element_failed_expressionHaveResult() {
        // GIVEN
        calculator.calculationText = "2 + 1"
        calculator.tappedNumber(numberText: "+")
        
        // THEN
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    func test_tappedNumber_expression_have_result() {
        // GIVEN
        calculator.calculationText = "2 + 1"
        
        // THEN
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    func test_zeroDivision_success() {
        // GIVEN
        calculator.calculationText = "2 / 0"
        
        // WHEN
        calculator.result()
        
        XCTAssertTrue(calculator.expressionHasNoZeroDivision)
    }
    
    func test_zeroDivision_failed() {
        // GIVEN
        calculator.calculationText = "2 / 2"
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.expressionHasNoZeroDivision)
    }
    
}
