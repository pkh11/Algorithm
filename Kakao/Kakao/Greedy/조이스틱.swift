//
//  조이스틱.swift
//  Kakao
//
//  Created by Kyoon Ho Park on 2021/01/06.
//

import Foundation

class 조이스틱 {
    func solution(_ name:String) -> Int {
        let alphabets = ["A", "B", "C", "D", "E", "F", "G", // 6
                         "H", "I", "J", "K", "L", "M", "N", // 13
                         "O", "P", "Q", "R", "S", "T", "U", // 20
                         "V", "W", "X", "Y", "Z"] // 25
        // 26 / 2  = 13 (index 12) 12이하면 왼쪽 / 초과면 오른쪽
        let mid = 13
        let start = alphabets.firstIndex(of: "A")!
        var sum = 0
        for char in name {
            let end = alphabets.firstIndex(of: String(char))!
            let distance = end - start
            
            if distance < mid {
                print(distance)
                sum += distance
            } else {
                print(alphabets.count - distance)
                sum += 1 // 커서 왼쪽으로 1번 이동
                sum += (alphabets.count - distance + 1)  // 알파벳으로 이동
            }
//            print(end-start)
        }
        print(sum)
        
        return 0
    }
}


