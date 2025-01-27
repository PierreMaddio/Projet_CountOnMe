//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTests: XCTestCase {
    
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
    
    // return true because expression have 3 elements
    func testIfExpressionHaveEnoughElement() {
        // GIVEN
        calculator.tappedNumber(numberText: "2 - 6")
        
        // THEN
        XCTAssertTrue(calculator.expressionHaveEnoughElement)
    }
    
    // return false because expression is not correct, countains only an operator
    func testIfExpressionIsCorrectErrorWithAdditionOperator() {
        // GIVEN
        calculator.tappedNumber(numberText: "+")
        
        // THEN
        XCTAssertFalse(calculator.expressionIsCorrect)
    }
    
    // test expressionHaveResult return true (calculationText countains "=")
    func testIfExpressionHaveEnoughElementSuccess() {
        // GIVEN
        calculator.calculationText = "2 + 1 = 3"
        
        // THEN
        XCTAssertTrue(calculator.expressionHaveResult)
    }
    
    // test expressionHaveResult return false (calculationText doesn't countains "=")
    func testIfExpressionHaveEnoughElementFailedAndExpressionHaveResult() {
        // GIVEN
        calculator.calculationText = "2 + 1"
        calculator.tappedNumber(numberText: "+")
        
        // THEN
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    // test expressionHaveResult return true (calculationText countains "=") another exemple l 162
    func testTappedNumberExpressionHaveResult() {
        // GIVEN
        calculator.calculationText = "2 + 1"
        
        // THEN
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    // check is the expression can be division by zero
    func testZeroDivisionSuccess() {
        // GIVEN
        calculator.calculationText = "2 / 0"
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertTrue(calculator.expressionHasZero)
    }
    
    // check is the expression can not be division by zero
    func testZeroDivisionFailed() {
        // GIVEN
        calculator.calculationText = "2 / 2"
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.expressionHasZero)
    }
    
    // return false because we can not add comma after plus
    func testIfAddCommaExpressionIsCorrectCommaFalse() {
        // GIVEN
        calculator.calculationText = "2 +"
        
        // THEN
        XCTAssertFalse(calculator.canAddComma)
    }
    
    // return true because we can add comma after a number
    func testIfAddCommaExpressionIsCorrectCommaTrue() {
        // GIVEN
        calculator.calculationText = "2 + 2"
        
        // THEN
        XCTAssertTrue(calculator.canAddComma)
    }
    
    // test calculationText = ""
    func testCalculationTextIsEmpty() {
        // GIVEN
        calculator.calculationText = "2 + 2 = 4"
        calculator.result()
        
        // THEN
        XCTAssertTrue(calculator.calculationText.isEmpty)
    }
    
    func testCalculationTextIsNotEmpty() {
        // GIVEN
        calculator.calculationText = "2 + 2"
        calculator.result()
        
        // THEN
        XCTAssertFalse(calculator.calculationText.isEmpty)
    }
    
}
