//
//  Graph.swift
//  LeetCode
//
//  Created by Kyoon Ho Park on 2021/05/28.
//

import Foundation

class Graph {
    
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var frequents = [String:Int]()
        
        words.forEach {
            if let count = frequents[$0] {
                frequents[$0] = count + 1
            } else {
                frequents[$0] = 1
            }
        }
        
        let sorted = frequents.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        }
        print(sorted)
        
        return sorted[0..<k].map{ $0.key }
    }
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequents = [Int:Int]()
        
        nums.forEach {
            if let count = frequents[$0] {
                frequents[$0] = count + 1
            } else {
                frequents[$0] = 1
            }
        }
        
        let sorted = frequents.sorted { $0.value > $1.value }
        return sorted[0..<k].map{ $0.key }
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted(by: >)
        return nums[k-1]
    }
}
