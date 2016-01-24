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
func getInputs(inputCount: Int) -> Array<Array<Int>> {
    
    var inputs: [[Int]] = []
    
    for var lineIndex = 0; lineIndex < inputCount; lineIndex++ {
        
        let line = getLine()
        var numberValues: [Int] = convertStringToNumbers(line)
        
        // Slice to correct N X N dimension
        if numberValues.count > inputCount {
            
            numberValues = Array(numberValues[0..<inputCount])
        }
        
        inputs.append(numberValues)
    }
    
    return inputs
}

// Solve for diagonal difference
func findDiagonalDifferenceLinear(numbersArray: [[Int]], n: Int) -> Int {
    
    // Base Case
    if n == 1 {
        return (numbersArray.first?.first)!
    }
    
    var flattenedArray: [Int] = []
    for array in numbersArray {
        flattenedArray.appendContentsOf(array)
    }
    
    var sum = 0
    let maxNum = n * n
    
    // Forward Diagonal
    for var index = 0; index < maxNum; index += (n + 1) {
        sum += flattenedArray[index]
    }
    
    // Backward Diagonal
    for var index = n - 1; index < maxNum - (n - 1); index += (n - 1) {
        sum -= flattenedArray[index]
    }
    
    return abs(sum)
}

func findDiagonalDifferenceLoop(numbersArray: [[Int]], n: Int) -> Int {
    
    var sum = 0
    var last = n - 1
    
    for var i = 0; i < n; i++ {
        
        for var j = 0; j < n; j++ {
            
            if j == i {
                
                sum += numbersArray[i][j]
            }
            
            if j == last {
                
                sum -= numbersArray[i][j]
            }
        }
        
        last--
    }
    
    return abs(sum)
}

// Run algorithm
let dataCount = getInputs(1).first?.first
let testData = getInputs(dataCount!)
//let linear = findDiagonalDifferenceLinear(testData, n: dataCount!)
let loop = findDiagonalDifferenceLoop(testData, n: dataCount!)

//print("\(linear)")
print("\(loop)")