//
//  MarkandToys.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/05.
//

import Foundation

class MarkandToys {
    // Complete the maximumToys function below.
    func maximumToys(prices: [Int], k: Int) -> Int {
        
        let sorted = prices.sorted(by: <)
        
        var sum = 0
        for (index, price) in sorted.enumerated() {
            sum += price
            if sum > k {
                return index
            }
        }

        return 0
    }
}
