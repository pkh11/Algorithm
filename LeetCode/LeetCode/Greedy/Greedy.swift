//
//  392.swift
//  LeedCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class Greedy {
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
            }
        }
        
        print(profit)
        return 0
    }
    
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        // s = abc
        // t = ahbgdc
        
        let array1 = Array(s).map{ String($0) }
        let array2 = Array(t).map{ String($0) }
        var result = false
        
        var str = ""
        var index = 0
        for i in 0..<array1.count {
            for j in index..<array2.count {
                if array1[i] == array2[j] {
                    str += array2[j]
                    index = j + 1
                    break
                }
            }
        }
        
        if s.elementsEqual(str) {
            result = true
        }
        
        return result
    }
}
