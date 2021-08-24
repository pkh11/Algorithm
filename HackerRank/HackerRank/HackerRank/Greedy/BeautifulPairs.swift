//
//  BeautifulPairs.swift
//  HackerRank
//
//  Created by 박균호 on 2021/08/24.
//

import Foundation

class BeautifulPairs {
    func beautifulPairs(A: [Int], B: [Int]) -> Int {
        // Write your code here

        var sortedA = A.sorted(by: <)
        var sortedB = B.sorted(by: <)
        var result = 0
        var aindex = 0
        var bindex = 0
         
        while aindex < sortedB.count && bindex < sortedB.count {
            if sortedA[aindex] > sortedB[bindex] {
                bindex += 1
            } else if sortedA[aindex] < sortedB[bindex] {
                aindex += 1
            } else {
                aindex += 1
                bindex += 1
                result += 1
            }
        }
        
        if result == sortedB.count {
            return result - 1
        }
        
        return result + 1
    }
}
