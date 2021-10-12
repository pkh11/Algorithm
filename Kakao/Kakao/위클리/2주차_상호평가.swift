//
//  2주차_상호평가.swift
//  Kakao
//
//  Created by 박균호 on 2021/10/12.
//

import Foundation

class Week2 {
    func solution(_ scores:[[Int]]) -> String {
        
        let size = scores.count
        var map = [Int:[Int]]()
        var result = ""
        
        for i in 0..<scores.count {
            var array = [Int]()
            
            for j in 0..<scores[0].count {
                array.append(scores[j][i])
            }
            
            map[i] = array
        }
        
        for i in 0..<size {
            var sum = 0
            let myScore = map[i]![i]
            let scores = map[i]!
            
            let maxScore = scores.max()!
            let minScore = scores.min()!
            let countOfMyScore = scores.filter { $0 == myScore }.count
            
            sum = scores.reduce(0, +)
            
            if countOfMyScore >= 2 {
                // 유일한 점수가 아니다
                sum /= size
            } else {
                // 유일한 점수
                if maxScore == myScore {
                    sum -= maxScore
                    sum /= (size-1)
                } else if minScore == myScore {
                    sum -= minScore
                    sum /= (size-1)
                } else {
                    sum /= size
                }
            }
            
            result += grade(score: sum)
        }
        print(result)
        
        return result
    }
    
    func grade(score: Int) -> String {
        switch score {
        case 90... :
            return "A"
        case 80..<90 :
            return "B"
        case 70..<80 :
            return "C"
        case 50..<70 :
            return "D"
        case ..<50:
            return "F"
        default:
            return ""
        }
    }
}
