//
//  CalculatorLogic.swift
//  BasicCalculator
//
//  Created by Minyoung Kim on 2022/06/02.
//

import SwiftUI

struct CalculatorLogic {
    
    private var number: Double?
    
    private var previousValue: Double?
    private var currentNumber: Double?
    private var activeOperation: CalcButton?
    private var calculatedValue: Double = 0

    //private var lastCalculation: (n1: Double, calcMethod: CalculatorButton)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private mutating func resetCalculator() -> Double {
        previousValue = nil
        currentNumber = nil
        activeOperation = nil
        return 0
    }
    
    private var lastInputEqual = false
    
    mutating func calculate(symbol: CalcButton) -> Double? {
        
        if let number = number {
            switch symbol {
            case .negative:
                if number != 0 { return number * -1 }
            case .clear:
                return resetCalculator()
            case .percent:
                return number * 0.01
            case .equal:
                
                lastInputEqual = true
                
                if let previousValue = previousValue {
                    if let currentNumber = currentNumber {
                        return performCalculation(previousValue: previousValue, currentNumber: currentNumber)
                    } else {
                        currentNumber = number
                        return performCalculation(previousValue: previousValue, currentNumber: number)
                    }
                }
                
            default:
                
                if lastInputEqual {
                    lastInputEqual = false
                    previousValue = nil
                }

                if let previousValue = previousValue {
                    let result = performCalculation(previousValue: previousValue, currentNumber: number)
                    activeOperation = symbol
                    return result
                }
                
                activeOperation = symbol
                currentNumber = nil
                previousValue = previousValue != nil ? previousValue : number
            }
        }
        return nil
    }

    private mutating func performCalculation(previousValue: Double, currentNumber: Double) -> Double? {
        
        if let operation = activeOperation {
            switch operation {
            case .plus:
                calculatedValue = previousValue + currentNumber
            case .minus:
                calculatedValue = previousValue - currentNumber
            case .multiply:
                calculatedValue = previousValue * currentNumber
            case .divide:
                calculatedValue = previousValue / currentNumber
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        self.previousValue = calculatedValue
        return calculatedValue
    }
    
    
}
