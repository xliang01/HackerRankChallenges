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

func getStepsLoop(steps: Int) -> [String] {
    
    var stepStrings = [String]()
    
    for var i = 0; i < steps; i++ {
        
        var value = ""
        
        for var j = 0; j < steps; j++ {
            
            if j < (steps - 1) - i {
                
                value += " "
            }
            else {
                
                value += "#"
            }
        }
        
        stepStrings.append(value)
    }
    
    return stepStrings
}

// Solve for diagonal difference
func getStepsLinear(steps: Int) -> String {
    
    var line = ""
    var stepCount = 1
    let maxSteps = steps * steps
    
    for var i = 0; i < maxSteps; i++ {
    
        let relativeStepsIndex = (i / steps) + 1
        
        if i >= (relativeStepsIndex * steps) - stepCount {
            
            line += "#"
        }
        else {
            
            line += " "
        }
        
        if (i + 1) % steps == 0 {
            
            line += "\n"
            stepCount++
        }
    }
    
    return line
}

//// Run algorithm
let dataCount = getInputs(1).first
let stepCharacters = getStepsLoop(dataCount!)
//let steps = getStepsLinear(dataCount!) // Slow!

//print("\(stepCharacters)")

//      # j = 2       i = 0
//    # # j = 2, 1    i = 1
//  # # # j = 2, 1, 0 i = 2

for stepChar in stepCharacters {
    
    print(stepChar)
}
