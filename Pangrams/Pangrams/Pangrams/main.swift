//
//  main.swift
//  Pangrams
//
//  Created by Xiao Liang on 1/26/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

func isPangram(string: String) -> Bool {
    
    var alphabetCount = 26
    var alphabetsCounter = [Int](count: alphabetCount, repeatedValue: 0)
    let characters = Array(sentence.characters)

    for char in characters {
        
        let characterString = String(char)
        if let ascii = characterString.unicodeScalars.first?.value {
            
            var offset = -1
            
            if ascii >= 97 && ascii <= 122 {
                
                offset = Int(ascii - 97)
            }
            else if ascii >= 65 && ascii <= 90 {
                
                offset = Int(ascii - 65)
            }
            
            if (offset >= 0 && offset <= 25 && alphabetsCounter[offset] == 0) {
                
                alphabetsCounter[offset]++
                alphabetCount--
            }
            
            if alphabetCount == 0 {
                
                return true
            }
        }
    }
    
    return false
}

let sentence = readLine()!

if isPangram(sentence) {
    print ("pangram")
}
else {
    print ("not pangram")
}

