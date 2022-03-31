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
        
        // test addition success
    // testGivenANumberPlusAnotherNumberWhenThen
        func testGivenNumber2OperandPlusNumber3WhenTappedEqualThenResultIs5() {
            // GIVEN
            calculator.tappedNumber(numberText: "2")
            calculator.addition()
            calculator.tappedNumber(numberText: "3")

            // WHEN
            calculator.result()

            // THEN
            XCTAssertEqual(calculator.resultString, "5")
        }

        // test addition failed
        func testGivenNumber2OperandPlusNumber3WhenTappedEqualThenResultIs6AndShouldBeFalse() {
            calculator.tappedNumber(numberText: "2")
            calculator.addition()
            calculator.tappedNumber(numberText: "3")

            calculator.result()

            XCTAssertFalse(calculator.resultString == "6")
        }
    
    // test substraction success
    func testGivenNumber5Dot8OperandMinusNumber3WhenTappedEqualThenResultIs2() {
        calculator.tappedNumber(numberText: "5.8")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")

        calculator.result()

        XCTAssertEqual(calculator.resultString, "2.8")
    }

    // test substraction failed
    func testGivenNumber2Dot5OperandMinusNumber3WhenTappedEqualThenResultIsMinus2Dot5AndShouldBeFalse() {
        calculator.tappedNumber(numberText: "2.5")
        calculator.substraction()
        calculator.tappedNumber(numberText: "3")

        calculator.result()

        XCTAssertFalse(calculator.resultString == "-2.5")
    }
    
    // test multiplication success
    func testGivenNumber6OperandMultiplicationNumber4WhenTappedEqualThenResultIs24() {
        calculator.tappedNumber(numberText: "6")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "4")

        calculator.result()

        XCTAssertEqual(calculator.resultString, "24")
    }

    // test multiplication failed
    func testGivenNumber7OperandMultiplicationNumber1WhenTappedEqualThenResultIs8AndShouldBeFalse() {
        calculator.tappedNumber(numberText: "7")
        calculator.multiplication()
        calculator.tappedNumber(numberText: "1")

        calculator.result()

        XCTAssertFalse(calculator.resultString == "8")
    }
    
    // test division success
    func testGivenNumber5OperandDivisionNumber2WhenTappedEqualThenResultIs2Dot5() {
        calculator.tappedNumber(numberText: "5")
        calculator.division()
        calculator.tappedNumber(numberText: "2")

        calculator.result()

        XCTAssertEqual(calculator.resultString, "2.5")
    }

    // test division failed
    func testGivenNumber10OperandDivisionNumber2WhenTappedEqualThenResultIs6AndShouldBeFalse() {
        calculator.tappedNumber(numberText: "10")
        calculator.division()
        calculator.tappedNumber(numberText: "2")

        calculator.result()

        XCTAssertFalse(calculator.resultString == "6")
    }
}
