//
//  Bit.swift
//  LeetCode
//
//  Created by 박균호 on 2021/04/22.
//

import Foundation

class Bit {
    func bitwiseComplement(_ n: Int) -> Int {
            
        let bits = String(n, radix: 2)
        var result = ""
        
        for char in bits {
            if char == "1" {
                result += "0"
            } else {
                result += "1"
            }
        }
        
        let num = Int(result, radix: 2)
//        print(num)
        
        return num!
    }
    
    func checkPowersOfThree(_ n: Int) -> Bool {
        // 3진법으로 표현했을때, bits에 2가 포함되어 있으면 3의 제곱근 형태로 표현할 수 없음
        let bits = String(n, radix: 3)
        if bits.contains("2") { return false }
        
        return true
    }
    
    var bit = ""
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard let head = head else { return 0 }
        
        let result = getValue(head)
        
        return Int(result)!
    }
    
    func getValue(_ head: ListNode?) -> String {
        guard let head = head else { return "" }
        bit += String(head.val)
        if let next = head.next {
            return getValue(next)
        } else {
            if let number = Int(bit, radix: 2) {
                return String(number)
            }
        }
    
        return ""
    }
    
    func sortByBits(_ arr: [Int]) -> [Int] {
        
        var tuple = [(Int,Int)]()
        
        for bit in arr {
            let countOfOne = bit.nonzeroBitCount
            tuple.append((bit, countOfOne))
        }
        
        let sorted = tuple.sorted {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return $0.1 < $1.1
            }
        }.map{ $0.0 }
        
        print(sorted)
        
        return sorted
    }
}



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

