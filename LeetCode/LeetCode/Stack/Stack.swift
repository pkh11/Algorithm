//
//  Stack.swift
//  LeetCode
//
//  Created by 박균호 on 2021/03/01.
//

import Foundation

class Stack {
    
    func minRemoveToMakeValid(_ s: String) -> String {
            
        // parentheness
        // 빈문자열, 온리 영소문자
        // 괄호로 연결되어 있어야 함 (두글자이상 영문)
        // 괄호로 연결되어 있어야 함 (영문)
        var array = Array(s)
        var stack = [(Character, Int)]()
        
        for (index, value) in array.enumerated() {
            if !value.isLetter {
                if let pop = stack.last {
                    if pop.0 == value {
                        stack.append((value, index))
                    } else {
                        if (pop.0 == "(" && value == ")") {
                            stack.removeLast()
                        } else {
                            stack.append((value, index))
                        }
                    }
                } else {
                    stack.append((value, index))
                }
            }
        }
        
        while !stack.isEmpty {
            let obj = stack.removeFirst()
            array[obj.1] = " "
        }
        
        let result = String(array).replacingOccurrences(of: " ", with: "")
//        let result = array.filter{ $0 != " " }.map{ String($0) }.joined()
        
        return result
    }
    
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
