//
//  GetMoneySpent.swift
//  HackerRank
//
//  Created by 박균호 on 2021/08/23.
//

import Foundation

class GetMoneySpent {
    func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
        /*
         * Write your code here.
         */
        
        var result = -1
        
        for keyboard in keyboards {
            for drive in drives {
                let sum = keyboard + drive
                
                if sum <= b {
                    result = max(result, sum)
                }
            }
        }
        
        print(result)
        
        return 0
    }
}
