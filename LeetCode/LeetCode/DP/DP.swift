//
//  DP.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/02.
//

import Foundation

class DP {
    func divisorGame(_ N: Int) -> Bool {
        
        let turn = 0
        
        while N > 0 {
            
        }
        
        
        return false
    }
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
                
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = min(dp[0] + cost[1], cost[1])
        
        // dp[i] i번째까지 mininumCost 담기
        
        for index in 2..<cost.count {
            dp[index] = min(dp[index-1] + cost[index], dp[index-2] + cost[index])
        }
        
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
}
