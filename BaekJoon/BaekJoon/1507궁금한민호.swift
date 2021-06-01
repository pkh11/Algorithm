//
//  1507궁금한민호.swift
//  BaekJoon
//
//  Created by 박균호 on 2021/05/31.
//

import Foundation


class BaekJoon1507 {
    func 궁금한민호() {
        let n = Int(readLine()!)!
        
        var map = Array(repeating: Array(repeating: 0, count: n), count: n)
        var canErased = Array(repeating: Array(repeating: false, count: n), count: n)
        
        for i in 0..<n {
            let datas = readLine()!.split(separator: " ").map{ Int($0)! }
            map[i] = datas
        }
        
        for middle in 0..<n {
            for start in 0..<n {
                if start == middle { continue }
                for end in 0..<n {
                    if start == end || middle == end {
                        continue
                    }
                    
                    if map[start][end] > map[start][middle] + map[middle][end] {
                        print(-1)
                        return
                    } else if map[start][end] == map[start][middle] + map[middle][end] {
                        canErased[start][end] = true
                    }
                    
                }
            }
        }
        
        var sum = 0
        
        for start in 0..<n {
            for end in 0..<n {
                if !canErased[start][end] {
                    sum += map[start][end]
                }
            }
        }
        
        print(sum/2)
    }
}
