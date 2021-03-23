//
//  BetweenTwoSets.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/23.
//

import Foundation

class BetweenTwoSets {
    func getTotalX(a: [Int], b: [Int]) -> Int {
        // Write your code here
        // 1. a의 공배수 구하기
        // 2. b의 공약수 구하기
        
        var result = 0
        
        for i in 1...100 {
            if commonMultiple(i, a) && commonDivisor(i, b) {
                result += 1
            }
        }
        
        print(result)
        
        return result
    }
    
    func commonMultiple(_ num: Int, _ a: [Int]) -> Bool {
        var count = 0
        for i in 0..<a.count {
            if num % a[i] == 0 {
                count += 1
            }
        }
        
        if count == a.count {
            return true
        }
        
        return false
    }
    
    func commonDivisor(_ num: Int, _ b: [Int]) -> Bool {
        var count = 0
        for i in 0..<b.count {
            if b[i] % num == 0 {
                count += 1
            }
        }
        
        if count == b.count {
            return true
        }
        return false
    }
}
