//
//  Graph.swift
//  LeetCode
//
//  Created by Kyoon Ho Park on 2021/05/28.
//

import Foundation

class Graph {
    
    // 백준 2606번
    func 바이러스(_ n: Int, _ connections: Int, _ pairs: [[Int]]) {
        
        var map = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
        (1...n).forEach { map[$0][$0] = 0 }
        
        for pair in pairs {
            let start = pair[0]
            let end = pair[1]
            
            map[start][end] = 1
            map[end][start] = 1
        }
        
        var visited = Array(repeating: false, count: n+1)
        var queue = [Int]()
        visited[1] = true
        queue.append(1)
        
        while !queue.isEmpty {
            let start = queue.removeFirst()
            for end in 1...n {
                if !visited[end] && map[start][end] == 1 {
                    visited[end] = true
                    queue.append(end)
                } else {
                    continue
                }
            }
        }
        
        let result = visited.filter { $0 }.count - 1
        print(result)
    }
    
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
