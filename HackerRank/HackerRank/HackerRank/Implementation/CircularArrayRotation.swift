//
//  CircularArrayRotation.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/30.
//

import Foundation

class CircularArrayRotation {
    func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
        
        let size = a.count
        var lotateCount = k % size
        var result = [Int]()
        
        if lotateCount == 0 {
            for i in 0..<queries.count {
                result.append(a[queries[i]])
            }
            
            print(result)
            
            return result
        } else {
            lotateCount = size - lotateCount
            var _a = [Int]()
            var left = a[lotateCount..<size]
            let right = a[0..<lotateCount]
            
            for i in 0..<right.count {
                left.append(right[i])
            }
            _a = Array(left)
            
            for i in 0..<queries.count {
                result.append(_a[queries[i]])
            }
            print(result)
    
            return  result
        }
    }
}
