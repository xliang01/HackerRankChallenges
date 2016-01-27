//
//  main.swift
//  FunnyString
//
//  Created by Xiao Liang on 1/27/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

func getAscii(char: Character) -> Int {
    
    let characterString = String(char)
    
    if let ascii = characterString.unicodeScalars.first?.value {
        
        return Int(ascii)
    }
    
    return 0
}

func isFunnyString(string: String) -> Bool {
    
    let characters = Array(string.characters)
    let charCount = characters.count
    
    if charCount <= 2 {
        
        return true
    }
    
    for charIndex in 0...(charCount / 2) {
        
        let leftAscii = getAscii(characters[charIndex])
        let leftNextAscii = getAscii(characters[charIndex + 1])
        
        let rightAscii = getAscii(characters[charCount - 1 - charIndex])
        let rightNextAscii = getAscii(characters[charCount - 2 - charIndex])
        
        if abs(leftAscii - leftNextAscii) != abs(rightAscii - rightNextAscii) {
            
            return false
        }
    }
    
    return true
}

let n = Int(readLine()!)!
var strings: [String] = [String]()

for i in 0...n - 1 {
    
    if let string = readLine() {
    
        strings.append(string)
    }
}

for string in strings {
    
    if isFunnyString(string) {
        
        print("Funny")
    }
    else {
        
        print("Not Funny")
    }
}