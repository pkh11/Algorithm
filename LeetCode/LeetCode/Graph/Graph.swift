//
//  Graph.swift
//  LeetCode
//
//  Created by Kyoon Ho Park on 2021/05/28.
//

import Foundation

class Graph {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted(by: >)
        return nums[k-1]
    }
}
