//
//  Bit.swift
//  LeetCode
//
//  Created by 박균호 on 2021/04/22.
//

import Foundation

class Bit {
    
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
