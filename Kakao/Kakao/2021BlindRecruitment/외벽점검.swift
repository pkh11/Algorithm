//
//  외벽점검.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/22.
//

import Foundation

class 외벽점검 {
    func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
        
        var weak = weak
//        var dist = dist.sorted(by: >)
        // 방향성 고려 안하기 위해 2배로 늘려줌
        for i in 0..<weak.count {
            weak.append(weak[i] + n)
        }
        print(dist)
        // dist에 대한 순열 갯수
        for i in 1...dist.count {
            var firends = [Int](repeating: 0, count: i)
            for j in 0..<i {
                firends[j] = dist[dist.count-1-j]
            }
            print(firends)
        }
        
        
        return 0
    }
    
    func permutation(_ array: [Int],_ index: Int,_ n: Int,_ k: Int) {
        if index == k {
            print(array)
            return
        }
        var array = array
        for i in index..<n {
            array.swapAt(i, n)
            permutation(array, index+1, n, k)
            array.swapAt(i, n)
        }
    }
}
