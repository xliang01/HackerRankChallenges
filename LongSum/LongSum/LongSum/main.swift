//
//  main.swift
//  LongSum
//
//  Created by Xiao Liang on 1/26/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

func getInput() -> [CUnsignedLongLong] {
    
    if let input = readLine() {
        
        let intArray = input.componentsSeparatedByString(" ").map({ (value) -> CUnsignedLongLong in
            return CUnsignedLongLong(value)!
        })
        
        return intArray
    }
    
    return []
}

func getLongSum(numbers: [CUnsignedLongLong]) -> CUnsignedLongLong {
    
    var sum: CUnsignedLongLong = 0
    
    for number in numbers {
        
        sum += number
    }
    
    return sum
}

let n = getInput().first
let numbers = getInput()
let sum = getLongSum(numbers)

print(sum)