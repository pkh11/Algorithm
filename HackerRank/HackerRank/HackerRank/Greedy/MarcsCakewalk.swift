//
//  MarcsCakewalk.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/04.
//

import Foundation

class MarcsCakewalk {
    // Complete the marcsCakewalk function below.
    func marcsCakewalk(calorie: [Int]) -> Int {

        let sorted = calorie.sorted(by: >)
        
        var miles = 0
        for (index, cal) in sorted.enumerated() {
            let cakes = NSDecimalNumber(decimal: pow(2.0, index))
            miles += Int(truncating: cakes) * cal
        }
        print(miles)
        
        return miles
    }

}
