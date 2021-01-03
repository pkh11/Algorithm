//
//  실패율.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 실패율 {
    // input(stages) [2, 1, 2, 6, 2, 4, 3, 3]
    // output(result) [3, 4, 2, 1, 5]
    func solution(_ N: Int, _ stages: [Int]) -> [Int] {
        
        var failurRateArrays = Array(repeating: 0.0, count: N)
        var notClears = Array(repeating: 0.0, count: N)
        var clears = Array(repeating: 0.0, count: N)
        
        // 클리어 못 한 사람 구하기
        for people in 0..<stages.count {
            let currentStage = stages[people]
            
            if currentStage <= N {
                notClears[currentStage - 1] += 1
            }
        }
        
        // 클리어 한 사람 구하기
        for stage in 0..<clears.count  {
            for people in 0..<stages.count {
                if stages[people] >= stage + 1 {
                    clears[stage] += 1
                }
            }
        }
        
        // 실패율 구하기
        for index in 0..<N{
            failurRateArrays[index] = notClears[index] / clears[index]
        }
        
        return failurRateArrays.enumerated().sorted(by: {$0.element > $1.element}).map({$0.offset + 1})
        
        //
        //        for step in 0..<N {
        //
        //            var numberOfPeople = 0
        //            var numberOfFail = 0
        //
        //            // step + 1 = 1, 2, 3, 4, 5
        //            // stage = 2, 1, 2, 6, 2, 4, 3, 3
        //
        //            for stage in stages {
        //                if step + 1 <= stage {
        //                    numberOfPeople += 1
        //                }
        //                if step + 1 == stage {
        //                    numberOfFail += 1
        //                }
        //            }
        //
        //            if numberOfPeople == 0 {
        //                failures[step] = 0
        //            } else {
        //                failures[step] = Double(numberOfFail) / Double(numberOfPeople)
        //            }
        //        }
        //
        //        return failures.enumerated().sorted(by: { $0.element > $1.element }).map{ $0.offset + 1}
    }
}
