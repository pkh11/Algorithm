//
//  No3.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/03.
//

import Foundation

class No3 {
    var count = 0
    var maxCount = 0
    func solution(_ n:Int, _ passenger:[Int], _ train:[[Int]]) -> [Int] {
        
        var trees = [Node]()
        var result = Array(repeating: Array(repeating: 0, count: 2), count: n)
        
//        trees.append(Node(1, passenger[0]))
        for i in 0..<n {
            trees.append(Node(i+1, passenger[i]))
        }

        for info in train {
            let start = info[0]
            let end = info[1]
            
            trees[start-1].childrens.append(trees[end-1])
        }
        
        for i in 1..<n {
            count = 0
            dfs(trees[0], i+1, trees[0].countOfPassenger)
            if maxCount < count {
                maxCount = count
            }
            result[i-1] = [i+1, count]
        }

        let maxValue = result.sorted(by: { $0[0] > $1[0]}).filter{ $0[1] == maxCount}

        return maxValue[0]
    }
    
    func dfs(_ root: Node?, _ target: Int, _ sum: Int) {
        guard let root = root else {
            return
        }

        if root.num == target {
            count = sum
            return
        }

        for i in 0..<root.childrens.count {
            dfs(root.childrens[i], target, sum + root.childrens[i].countOfPassenger)
        }
        
    }
}


class Node {
    var num: Int
    var countOfPassenger : Int
    var childrens: [Node]
    
    public init(_ num: Int, _ count: Int) {
        self.num = num
        self.countOfPassenger = count
        self.childrens = []
    }
}

