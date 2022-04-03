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
    
    // testGivenANumberPlusAnotherNumberWhenTappedEqualThenResultIsFive
    func test_addition_success() {
        // GIVEN
        calculator.tappedNumber(numberText: "2")
        calculator.addition()
        calculator.tappedNumber(numberText: "3")
        
        // WHEN
        calculator.result()
        
        // THEN
        XCTAssertEqual(calculator.resultString, "5")
    }
    
    func test_addition_failed() {
        calculator.tappedNumber(numberText: "2")
        calculator.addition()
        calculator.tappedNumber(numberText: "3")
        
        calculator.result()
        
        XCTAssertFalse(calculator.resultString == "6")
    }
    
    func test_substraction_success() {
        calculator.tappedNumber(numberText: "5.8")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")
        
        calculator.result()
        
        XCTAssertEqual(calculator.resultString, "2.8")
    }
    
    func test_substraction_failed() {
        calculator.tappedNumber(numberText: "2.5")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")
        
        calculator.result()
        
        XCTAssertFalse(calculator.resultString == "-2.5")
    }
    
    func test_multiplication_success() {
        calculator.tappedNumber(numberText: "6")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "4")
        
        calculator.result()
        
        XCTAssertEqual(calculator.resultString, "24")
    }
    
    func test_multiplication_failed() {
        calculator.tappedNumber(numberText: "7")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "1")
        
        calculator.result()
        
        XCTAssertFalse(calculator.resultString == "8")
    }
    
    func test_division_success() {
        calculator.tappedNumber(numberText: "5")
        calculator.division()
        calculator.tappedNumber(numberText: "2")
        
        calculator.result()
        
        XCTAssertEqual(calculator.resultString, "2.5")
    }
    
    func test_division_failed() {
        calculator.tappedNumber(numberText: "10")
        calculator.division()
        calculator.tappedNumber(numberText: "2")
        
        calculator.result()
        
        XCTAssertFalse(calculator.resultString == "6")
    }
    
    // Expression is correct when having a number in numberText
    func testIfExpressionIsCorrect() {
        calculator.tappedNumber(numberText: "2")
        calculator.tappedNumber(numberText: "+")
        calculator.tappedNumber(numberText: "1")
        
        XCTAssertTrue(calculator.expressionIsCorrect)
    }
    
    func test_if_expression_is_correct_error_with_addition_operator() {
        calculator.tappedNumber(numberText: "+")
        
        XCTAssertFalse(calculator.expressionIsCorrect)
    }
    
    func test_expression_have_enough_element_success() {
        calculator.calculationText = "2+1=3"
        calculator.tappedNumber(numberText: "+")
        
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    func test_expression_have_enough_element_failed_expressionHaveResult() {
        calculator.calculationText = "2+1=3"
        calculator.tappedNumber(numberText: "+")
        
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
    func test_tappedNumber_expression_have_result() {
        calculator.calculationText = "2+1"
        
        XCTAssertFalse(calculator.expressionHaveResult)
    }
    
}
