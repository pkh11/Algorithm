//
//  MinimumAbsoluteDifferenceArray.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/04.
//

import Foundation

class MinimumAbsoluteDifferenceArray {
    // Complete the minimumAbsoluteDifference function below.
    func minimumAbsoluteDifference(arr: [Int]) -> Int {

        let sorted = arr.sorted(by: <)
        var minValue = 1000000000

        for i in 0..<sorted.count - 1 {
            minValue = min(minValue, abs(sorted[i] - sorted[i+1]))
        }
        
        return minValue
    }
}
