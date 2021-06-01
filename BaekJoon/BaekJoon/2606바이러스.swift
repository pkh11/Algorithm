//
//  2606바이러스.swift
//  BaekJoon
//
//  Created by 박균호 on 2021/05/31.
//

import Foundation

class BaekJoon2606 {
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
}
