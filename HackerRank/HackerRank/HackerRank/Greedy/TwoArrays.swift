//
//  TwoArrays.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/04.
//

import Foundation

class TwoArrays {
    // Complete the twoArrays function below.
    func twoArrays(k: Int, A: [Int], B: [Int]) -> String {

        let newA = A.map{ k - $0 }.sorted(by: <)
        let newB = B.sorted(by: <)
        
        for (index, value) in newA.enumerated() {
            if newB[index] < value {
                return "NO"
            }
        }
        
        return "YES"
    }
}
