//
//  main.swift
//  GameOfThrones
//
//  Created by Xiao Liang on 1/30/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

func isAnagramPalidrome(characters: [Character]) -> Bool {
    
    var characterCounts = [Int](count: 26, repeatedValue: 0)
    
    for char in characters {
        
        let characterString = String(char)
        if let ascii = characterString.unicodeScalars.first?.value {
            
            let offset = Int(ascii - 97)
            if offset >= 0 && offset <= 25 {
                
                characterCounts[offset]++
            }
        }
    }
    
    // If the string has an even number of characters, make sure all character counts are even.
    // If there is one odd count, then the word is not a palidrome and we fail
    if characters.count % 2 == 0 {
        
        for count in characterCounts {
            
            if count % 2 != 0 {
                
                return false
            }
        }
        
        return true
    }
    // If the string has an odd number of characters, make sure no more than one character set count is odd.
    // If there is more than one odd count, then the word is not a palidrome and we fail
    else {
        
        var oddCounts = 0
        
        for count in characterCounts {
            
            if count % 2 != 0 {
                
                oddCounts++
                
                if (oddCounts > 1) {
                    
                    return false
                }
            }
        }
        
        return true
    }
}

let string = readLine()!
let characters = [Character](string.characters)

isAnagramPalidrome(characters) ? print("YES") : print("NO")

