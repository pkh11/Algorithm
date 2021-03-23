//
//  GradingStudents.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/23.
//

import Foundation

class GradingStudents {
    func gradingStudents(grades: [Int]) -> [Int] {
        // Write your code here

        // 1. 38이상이면 round 점수 계산 (다음 5의 배수)
        //    round 점수 - original >= 3 : original
        //    round 점수 - original == 3 : original
        //    round 점수 - original < 3 : 다음 5의 배수
        // 2. 38미만이면 점수 그대로
        
        var newGrades = [Int]()
        
        for grade in grades {
            if grade < 38 {
                newGrades.append(grade)
            } else {
                let nextMultipleOfFive = calculateNextMultiple(grade)
                let gap = nextMultipleOfFive - grade
                
                if gap < 3 {
                    newGrades.append(nextMultipleOfFive)
                } else {
                    newGrades.append(grade)
                }
            }
        }
        
        print(newGrades)
        
        return newGrades
    }
    
    func calculateNextMultiple(_ grade: Int) -> Int {
        return (grade / 5 + 1) * 5
    }
}
