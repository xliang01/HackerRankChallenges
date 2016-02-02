//
//  main.swift
//  MakeItAnagram
//
//  Created by Xiao Liang on 2/2/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

let firstLine = readLine()!
let secondLine = readLine()!

var charCount = [Character : Int]()

let firstLineCharacters = [Character](firstLine.characters)
let secondLineCharacters = [Character](secondLine.characters)

for var char in firstLineCharacters {
    
    if let count = charCount[char] {
        
        charCount[char] = count + 1
    }
    else {
        
        charCount[char] = 1
    }
}

for var char in secondLineCharacters {
    
    if let count = charCount[char] {
        
        charCount[char] = count - 1
    }
    else {
        
        charCount[char] = -1
    }
}

var subtractCount = 0
for (char, count) in charCount {
    
    if count != 0 {
        subtractCount += abs(count)
    }
}

print (subtractCount)