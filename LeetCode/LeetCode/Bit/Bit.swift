//
//  Bit.swift
//  LeetCode
//
//  Created by 박균호 on 2021/04/22.
//

import Foundation

class Bit {
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
