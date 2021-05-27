//
//  합승택시요금.swift
//  Kakao
//
//  Created by 박균호 on 2021/05/25.
//

import Foundation

class 합승택시요금 {
    
    var targetA = 0
    var targetB = 0
    var size = 0
    let intMax = 987654321
    
    func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
        
        var map = Array(repeating: Array(repeating: intMax, count: n), count: n)
        
        targetA = a - 1
        targetB = b - 1
        size = n
        
        for fare in fares {
            let start = fare[0]
            let end = fare[1]
            let cost = fare[2]
            
            map[start-1][end-1] = cost
            map[end-1][start-1] = cost
        }
        
        var cost = path(s-1, a-1, map) + path(s-1, b-1, map)
        
        for i in 0..<size {
            if s-1 != i {
                cost = min(cost, path(s-1, i, map) + path(i, a-1, map) + path(i, b-1, map))
            }
        }
        
        print(cost)
        
        return cost
    }
    
    func path(_ start: Int, _ end: Int, _ map: [[Int]]) -> Int {
        
        var distance = Array(repeating: intMax, count: size)
        var visited = Array(repeating: false, count: size)
        distance[start] = 0
        
        var queue = [(Int,Int)]() // (start, cost)
        queue.append((start,distance[start]))
        
        while !queue.isEmpty {
            
            let data = queue.removeFirst()
            let start = data.0
            let cost = data.1
            
            if distance[start] < cost {
                continue
            }
            
            for end in 0..<size {
                if !visited[end] && map[start][end] != intMax {
                    if (distance[start] + map[start][end]) < distance[end] {
                        distance[end] = distance[start] + map[start][end]
                        queue.append((end, distance[end]))
                    }
                }
            }
            
            visited[start] = true
        }
        
        print(distance)
        
        return distance[end]
    }
}
