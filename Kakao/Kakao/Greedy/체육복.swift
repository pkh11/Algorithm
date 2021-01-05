//
//  체육복.swift
//  Kakao
//
//  Created by Kyoon Ho Park on 2021/01/05.
//

import Foundation

class 체육복 {
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        
        let reserves = reserve
        var students = Array(repeating: 0, count: n)
        
        for i in lost { students[i-1] -= 1 }
        for i in reserves { students[i-1] += 1 }
        
        print(students)
        
        for (index, hasClothes) in students.enumerated() {
            if hasClothes == -1 {
                if (index > 0 && students[index - 1] == 1) {
                    students[index - 1] -= 1
                    students[index] += 1
                } else if (index < students.count - 1) && students[index + 1] == 1 {
                    students[index + 1] -= 1
                    students[index] += 1
                }
            }
        }
        print(students)

        
        return students.filter{ $0 >= 0 }.count
    }
}
