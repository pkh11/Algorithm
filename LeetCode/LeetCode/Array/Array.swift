//
//  _Array.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/05.
//

import Foundation

class _Array {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // [1, 12, -5, -6, 50, 3] : 55
        // [-6, -5, 1, 3, 12, 50]
        // [1, 13, 8, 2 ,52 ,55]
        var max = Int.min
        var currentValue = 0
        for index in (0...nums.count-1){
            if index < k{
                currentValue += nums[index]
            } else {
                if currentValue > max{
                    max = currentValue
                }
                currentValue += nums[index] - nums[index - k]
            }
        }
        if currentValue > max{
            max = currentValue
        }
        return Double(max) / Double(k)
    }
}
