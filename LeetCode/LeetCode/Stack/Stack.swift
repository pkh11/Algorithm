//
//  Stack.swift
//  LeetCode
//
//  Created by 박균호 on 2021/03/01.
//

import Foundation

class Stack {
    
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
                
        var empty = [Int]()
        var result = [String]()
        
        for i in 1...n {
            result.append("Push")
            if !target.contains(i) {
                result.append("Pop")
            } else {
                empty.append(i)
            }
            
            if empty == target {
                break
            }
        }
        
        print(result)
        
        return result
    }
    
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
