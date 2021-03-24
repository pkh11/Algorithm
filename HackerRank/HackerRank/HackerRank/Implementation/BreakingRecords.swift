//
//  BreakingRecords.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/24.
//

import Foundation

class BreakingRecords {
    func breakingRecords(scores: [Int]) -> [Int] {
        // [12, 24, 10, 24]
        
        var minimum = scores[0]
        var maximum = scores[0]
        var minOfCount = 0
        var maxOfcount = 0
        
        for i in 1..<scores.count {
            let score = scores[i]
            
            if score > maximum {
                maximum = score
                maxOfcount += 1
            }
            
            if score < minimum {
                minimum = score
                minOfCount += 1
            }
        }
        
        return [maxOfcount, minOfCount]
    }
}
