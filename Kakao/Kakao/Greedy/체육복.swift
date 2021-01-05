//
//  체육복.swift
//  Kakao
//
//  Created by Kyoon Ho Park on 2021/01/05.
//

import Foundation

class 체육복 {
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        
        var reserves = reserve
        var students = Array(repeating: false, count: n)
        
        for i in 0..<n {
            if reserve.contains(i+1) || !lost.contains(i+1) {
                students[i] = true
            }
        }
        
        print(students)
        
        for i in 0..<students.count {
            if reserves.contains(i+1) {
                if i == 0 {
                    if !students[i+1] {
                        students[i+1] = true
                    }
                } else if i == students.count - 1 {
                    if !students[i-1] {
                        students[i-1] = true
                    }
                } else {
                    if !students[i+1] {
                        students[i+1] = true
                    } else if !students[i-1] {
                        students[i-1] = true
                    }
                }
            
                reserves.remove(at: reserves.firstIndex(of: i+1)!)
            }
        }
        
        return students.filter{ $0 }.count
    }
}
