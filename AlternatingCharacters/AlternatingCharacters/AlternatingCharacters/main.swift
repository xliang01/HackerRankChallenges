//
//  main.swift
//  AlternatingCharacters
//
//  Created by Xiao Liang on 1/30/16.
//  Copyright © 2016 MindMountain. All rights reserved.
//

import Foundation

func findDeletes(string: String) -> Int {
    
    let characters = [Character](string.characters)
    let n = characters.count
    var deletes = 0
    
    for var i = 0; i < n - 1; i++ {
        
        deletes += characters[i] == characters[i + 1] ? 1 : 0
    }
    
    return deletes
}


let n = Int(readLine()!)!
var inputs = [String?](count: n, repeatedValue: nil)

for var i in 0...n-1 {
    
    inputs[i] = readLine()!
}

for input in inputs {
    
    print(findDeletes(input!))
}