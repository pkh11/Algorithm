//
//  예산.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 예산 {
    func solution(_ d:[Int], _ budget:Int) -> Int {
        
        let sorted = d.sorted(by:<)
        var sum = 0
        var result = 0
        for (index, value) in sorted.enumerated() {
            sum += value
            if sum <= budget {
                result = index + 1
            }
        }
        print(result)
        
        return 0
    }
}
