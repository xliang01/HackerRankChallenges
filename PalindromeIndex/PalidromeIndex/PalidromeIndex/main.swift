//
//  main.swift
//  PalidromeIndex
//
//  Created by Xiao Liang on 2/5/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

//// First Attempt
//func palidromeIndex(var chars: [Character], skipIndex: Int?) -> Int {
//    
//    if chars.count <= 1 {
//        
//        return -1
//    }
//    else {
//    
//        if let skipIndex = skipIndex where skipIndex >= 0 && skipIndex < chars.count {
//            
//            chars.removeAtIndex(skipIndex)
//        }
//        
//        // Actual palidrome check
//        for i in (0...chars.count/2) {
//            
//            let firstIndex = i
//            let lastIndex = chars.count - 1 - i
//            
//            if chars[firstIndex] != chars[lastIndex] {
//                
//                if palidromeIndex(chars, skipIndex: firstIndex) == -1 {
//                    
//                    return firstIndex
//                }
//                else {
//                    
//                    return lastIndex
//                }
//            }
//        }
//
//        return -1
//    }
//}

// Second Attempt
//func palidromeIndex(var chars: [Character]) -> Int {
//
//    let n = chars.count
//    
//    if n <= 1 {
//
//        return -1
//    }
//    else {
//        
//        // Actual palidrome check
//        for i in (0...n/2) {
//            
//            if chars[i] != chars[n - 1 - i] {
//
//                chars.removeAtIndex(i)
//                
//                if isPalidromCount(chars) {
//                    
//                    return i
//                }
//                else {
//                    
//                    return n - 1 - i
//                }
//            }
//        }
//
//        return -1
//    }
//}
//
//func isPalidromCount(chars: [Character]) -> Bool {
//    
//    var charCount = [Character: Int]()
//    
//    for char in chars {
//        
//        if let count = charCount[char] {
//            
//            charCount[char] = count + 1
//        }
//        else {
//            
//            charCount[char] = 1
//        }
//    }
//    
//    if chars.count % 2 == 0 {
//        
//        for (_, count) in charCount {
//            
//            if count % 2 != 0 {
//                
//                return false
//            }
//        }
//        
//        return true
//    }
//    else {
//        
//        var oddCounts = 0
//        
//        for (_, count) in charCount {
//            
//            if count % 2 != 0 {
//                
//                oddCounts++
//            }
//        }
//        
//        return oddCounts == 1
//    }
//}

// Third Attempt
//func palidromeIndex(var chars: [Character]) -> Int {
//    
//    var charCount = [Character: Int]()
//
//    for char in chars {
//
//        if let count = charCount[char] {
//
//            charCount[char] = count + 1
//        }
//        else {
//
//            charCount[char] = 1
//        
//        }
//    }
//    
//    let n = chars.count
//
//    if n <= 1 {
//
//        return -1
//    }
//    else {
//        
//        let midPoint = n/2
//        
//        // Actual palidrome check
//        for i in (0...midPoint) {
//
//            let startChar = chars[i]
//            let endChar = chars[n - 1 - i]
//            
//            if startChar != endChar {
//                
//                let startCharCount = charCount[startChar]
//                let endCharCount = charCount[endChar]
//                
//                // Can be either
//                if (startCharCount >= endCharCount) {

//                    return n - 1 - i
//                }
//                else {
//                    
//                    return i
//                }
//            }
//        }
//
//        return -1
//    }
//}

// Fourth attempt
func palidromeIndex(var chars: [Character]) -> Int {

    let n = chars.count

    if n <= 1 {

        // _
        // a
        return -1
    }
    // Pick one
    else if n == 2 {
        
        // ab
        // ba
        return 0
    }
    else {

        let midPoint = n/2

        // Actual palidrome check
        for i in (0...midPoint) {

            let startIndex = i
            let endIndex = n - 1 - i
            
            if chars[startIndex] != chars[endIndex] {
                
                // aab
                // baa
                // babba
                // abbab
                
                let nextLetterIsEqualToEnd = chars[startIndex + 1] == chars[endIndex]
                let currentLetterIsEqualToLast = chars[startIndex] == chars[endIndex - 1]
                
                if nextLetterIsEqualToEnd && currentLetterIsEqualToLast {
                    
                    if chars[i + 2] == chars[endIndex - 1] {
                        
                        return startIndex
                    }
                    else {
                        
                        return endIndex
                    }
                }
                else if nextLetterIsEqualToEnd {
                    
                    return startIndex
                }
                else {
                    
                    return endIndex
                }

            }
        }

        return -1
    }
}

let n = Int(readLine()!)!
var values: [String] = [String]()

for i in (0...n-1) {
    
    values.append(readLine()!)
}

for value in values {
    
    let characters = [Character](value.characters)
    
    print(palidromeIndex(characters))
}
