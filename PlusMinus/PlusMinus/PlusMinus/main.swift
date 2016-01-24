//
//  main.swift
//  HackerRank
//
//  Created by Xiao Liang on 1/23/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

// Convert string to integer without carriage return or special characters
func getIntegerValue(value: String?) -> Int {
    
    var intValue: Int = 0
    
    if let value = value where !value.isEmpty {
        
        // Get rid of carriage returns and special characters
        let string = value.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "la t, \r \n \" :"))
        intValue = Int(string)!
    }
    
    return intValue
}

// Convert a line into an array of numbers
func convertStringToNumbers(stringValue: String) -> [Int] {
    
    let stringValues = stringValue.componentsSeparatedByString(" ")
    
    let numberValues = stringValues.map({ (value: String) -> Int in
        
        return getIntegerValue(value)
    })
    
    return numberValues
}

// Read from standard in
func getLine() -> String {
    
    var line = String()
    var c = getchar()
    
    // 10 is ascii code for newline
    while c != EOF && c != 10 {
        
        line.append(UnicodeScalar(UInt32(c)))
        c = getchar()
    }
    
    return line
}

// Get all inputs and convert to an array of integer lists
func getInputs(inputCount: Int) -> [Int] {

    let line = getLine()
    var numberValues: [Int] = convertStringToNumbers(line)
    
    if numberValues.count > inputCount {
        
        numberValues = Array(numberValues[0..<inputCount])
    }
    
    return numberValues
}

enum answerType {
    
    case Positive
    case Negative
    case Zero
}

// Solve for diagonal difference
func findFractions(numbersArray: [Int]?) -> [answerType: Double] {
    
    var positiveFraction = 0.0
    var negativeFraction = 0.0
    var zeroFraction = 0.0
    
    if let numbersArray = numbersArray {
    
        let n = Double(numbersArray.count)
        var negativeCount = 0.0
        var positiveCount = 0.0
        
        for value in numbersArray {
            
            if value < 0 {
                
                negativeCount++
            }
            else if value > 0 {
                
                positiveCount++
            }
        }
        
        positiveFraction = positiveCount / n
        negativeFraction = negativeCount / n
        zeroFraction = (n - positiveCount - negativeCount) / n
    }
    
    return [.Positive: positiveFraction,
            .Negative: negativeFraction,
            .Zero: zeroFraction]
}

// Run algorithm
let dataCount = getInputs(1).first
let testData = getInputs(dataCount!)
let fractions = findFractions(testData)

print("\(NSString(format: "%.6f", fractions[.Positive]!))")
print("\(NSString(format: "%.6f", fractions[.Negative]!))")
print("\(NSString(format: "%.6f", fractions[.Zero]!))")