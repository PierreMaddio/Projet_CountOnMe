//
//  Calculator.swift
//  CountOnMe
//
//  Created by Pierre on 28/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: - Properties
    // Property to store the text of the calculation
    var calculationText: String = ""
    
    // Property to round the result if not a decimal number
    var resultString: String = ""
    
    // Array of selected elements
    var elements: [String] {
        return calculationText.split(separator: " ").map { "\($0)" }
    }
    
    // Property used to calculate the result
    var operationsToReduce = [String]()
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    // Check if an operation has at least 3 elements
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.first != nil
    }
    
    var canAddComma: Bool {
            return (elements.last != "+" &&
            elements.last != "-" &&
            elements.last != "/" &&
            elements.last != "x" )
        }
    
    // Check if the equal operator is placed at the end to perform the calculation
    var expressionHaveResult: Bool {
        return calculationText.firstIndex(of: "=") != nil
    }
    
    // Check if no division by zero
    var expressionHasNoZeroDivision: Bool = false
    
    // MARK: - Method
    
    // Tapped number
    func tappedNumber(numberText: String) {
        if expressionHaveResult {
            calculationText = ""
        }
        calculationText.append(numberText)
    }
    
    func addition() {
        if canAddOperator {
            calculationText.append(" + ")
        }
    }
    
    func substraction() {
        if canAddOperator{
            calculationText.append(" - ")
        }
    }
    
    func multiplication() {
        if canAddOperator{
            calculationText.append(" x ")
        }
    }
    
    func division() {
        if canAddOperator{
            calculationText.append(" / ")
        }
    }
    
    // Method for result
    func result() {
        // Create local copy of operations for result method
        operationsToReduce = elements
        
        // Reset calculation if result already received
        if expressionHaveResult {
            calculationText = ""
        } else {
            // Check if a division by zero exists
            zeroDivision()
            
            if expressionHasNoZeroDivision == false {
                // Iterate over operations while an operand still here
                while operationsToReduce.count > 1 {
                    calculatorResult()
                }
                calculationText.append(" = \(operationsToReduce.first!)")
            }
        }
    }
    
    // Round the result by two digits after the decimal point
    private func roundResult(result: Double) {
        resultString = String(format: "%.2f", result) // Ex : 23.33 -> ["23", "00"]
        let arrayResult = resultString.split(separator: ".") // ["23", "33"]
        if arrayResult.last ?? "" == "00" {
            resultString = String(arrayResult.first ?? "")
        }
    }
    
    private func calculatorResult() {
        if operationsToReduce.count >= 3 {
            let left = Double(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Double(operationsToReduce[2])!
            var result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            
            // Round the result
            roundResult(result: result)
            operationsToReduce.insert(resultString, at: 0)
        }
    }
    
    // Check if division by zero is in the expression
    private func zeroDivision(){
        for i in 0...(elements.count-1) {
            // Make sure i is still in the range
            if i > 1 && i <= elements.count-1 {
                // Find the divisions and check if followed by zero
                if elements[i-1] == "/" && elements[i] == "0" {
                    calculationText = ""
                    expressionHasNoZeroDivision = true
                } else {
                    expressionHasNoZeroDivision = false
                }
            }
        }
    }
}
