//
//  로또의 최고순위와 최저순위.swift
//  Kakao
//
//  Created by 박균호 on 2021/05/24.
//

import Foundation

class 로또의최고순위와최저순위 {
    
    let grade: [Int:Int] = [6:1,5:2,4:3,3:4,2:5,1:6,0:6]
    
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        let maxGrade: Int = grade[findMaxGrade(lottos, win_nums)]!
        let minGrade: Int = grade[findMinGrade(lottos, win_nums)]!
        return [maxGrade, minGrade]
    }
    
    func findMinGrade(_ lottos:[Int], _ win_nums:[Int]) -> Int {
        
        var matchingNumber = 0
        lottos.forEach { lotto in
            win_nums.forEach { winNum in
                if lotto == winNum {
                    matchingNumber += 1
                }
            }
        }
        
        if matchingNumber > 0 {
            return matchingNumber
        } else {
            return 0
        }
    }
    
    func findMaxGrade(_ lottos:[Int], _ win_nums:[Int]) -> Int {
        
        var matchingNumber = 0
        lottos.forEach { lotto in
            win_nums.forEach { winNum in
                if lotto == winNum {
                    matchingNumber += 1
                }
            }
        }
        
        let noNumber = lottos.filter { $0 == 0 }.count
        
        return matchingNumber + noNumber
    }
}
