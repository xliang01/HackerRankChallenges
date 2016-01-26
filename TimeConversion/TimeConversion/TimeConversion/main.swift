//
//  main.swift
//  TimeConversion
//
//  Created by Xiao Liang on 1/26/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

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

func converTo24HourFormat(normalFormat: String) -> String {
    
    let timeComponents = normalFormat.componentsSeparatedByString(":")
    
    if timeComponents.count == 3 {
        
        var hour = Int(timeComponents[0])!
        let min = Int(timeComponents[1])!
        
        let sec = timeComponents[2]
        let secValue = Int(sec.substringToIndex(sec.startIndex.advancedBy(2)))!
        let secType = sec.substringFromIndex(sec.startIndex.advancedBy(2))
        
        if secType.uppercaseString == "PM" && hour >= 1 && hour <= 11 {
         
            hour = (hour + 12) % 24
        }
        else if secType.uppercaseString == "AM" && hour == 12 {
            
            hour = 0
        }
        
        return String(format: "%02d:%02d:%02d", hour, min, secValue)
    }
    
    return ""
}

let timeInput = getLine()
let convertedTime = converTo24HourFormat(timeInput)

print("\(convertedTime)")