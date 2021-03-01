//
//  Stack.swift
//  LeetCode
//
//  Created by 박균호 on 2021/03/01.
//

import Foundation

class Stack {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        
        var result = [Int]()
        var index = 0
    
        for i in 0..<pushed.count {
            
            result.append(pushed[i])
            
            while !result.isEmpty {
                let peek = result.last!
                
                if peek == popped[index] {
                    result.removeLast()
                    index += 1
                } else {
                    break
                }
            }
        }
        
        print(result)
        
        if result.count == 0 {
            return true
        } else {
            return false
        }
    }
}
