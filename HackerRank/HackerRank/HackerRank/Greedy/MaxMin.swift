//
//  MaxMin.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/04.
//

import Foundation

class MaxMin {
    // Complete the maxMin function below.
    func maxMin(k: Int, arr: [Int]) -> Int {
        
        let sorted = arr.sorted(by: <)
        
        var minValue = sorted.max()!
        for i in 0..<sorted.count - k + 1{
            let prefixArray = sorted[i..<i+k]
            
            let maxNum = prefixArray.last!
            let minNum = prefixArray.first!
            
            
            
            minValue = min(minValue, maxNum-minNum)
            print(minValue)
        }

        print(minValue)
        return 0
    }
}
