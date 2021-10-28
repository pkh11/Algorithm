//
//  DP.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/02.
//

import Foundation

class DP {
    
    func tribonacci(_ n: Int) -> Int {
        
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 1
        }
        
        var array = [Int](repeating: 0, count: n+1)

        array[0] = 0
        array[1] = 1
        array[2] = 1

        for i in 3..<array.count {
            array[i] = array[i-1] + array[i-2] + array[i-3]
        }
        print(array)
        print(array[n])

        return array[n]
    }
    
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else {
            var dp = Array(repeating: 0, count: n+1)
            dp[0] = 0
            dp[1] = 1
            
            for i in 2...n {
                dp[i] = dp[i-1] + dp[i-2]
            }
            
            return dp[n]
        }
    }
    
    func countBits(_ n: Int) -> [Int] {
        
        var dp = Array(repeating: 0, count: n+1)
        
        for i in 0...n {
            dp[i] = String(i, radix: 2).filter{ $0 == "1" }.count
        }
        print(dp)
        
        
        return dp
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        // [7,1,5,3,6,4]
        
        var dp = Array(repeating: 0, count: prices.count)
//  code 1
//        var start = 0
//        var end = 0
//        var index = 1
//        var temp = prices[0]
//
//        while index < prices.count {
//            if temp > prices[index] {
//                end += 1
//                start = end
//                temp = prices[index]
//            } else {
//                end += 1
//                dp[index] = prices[end] - prices[start]
//            }
//            index += 1
//        }
        
// code 2
        var result = 0
        var minPrice = Int.max
        for i in 0..<prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            }
            result = max(result, prices[i] - minPrice)
            print(result)
        }
    
        return dp.max()!
    }
    
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
