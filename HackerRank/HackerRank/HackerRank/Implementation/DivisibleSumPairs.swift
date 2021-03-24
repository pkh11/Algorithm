//
//  DivisibleSumPairs.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/24.
//

import Foundation

class DivisibleSumPairs {
    func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {

        // i < j && a[i] + a[j] % == 0
        var result = 0
        
        for i in 0..<ar.count-1 {
            for j in i+1..<ar.count {
                let sum = ar[i] + ar[j]
                if sum % k == 0 {
                    result += 1
                }
            }
        }
        
        print(result)
        return result
    }
}
