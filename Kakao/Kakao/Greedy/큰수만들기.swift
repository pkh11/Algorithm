//
//  큰수만들기.swift
//  Kakao
//
//  Created by Kyoon Ho Park on 2021/01/08.
//

import Foundation

class 큰수만들기 {
     // K개 제거 후 만들 수 있는 가장 큰 숫자
    // k = 2 , 1924
    func solution(_ number:String, _ k:Int) -> String {
        
        let array = Array(number).map{ String($0) }.map{ Int($0)! }
        let pick = number.count - k
        
        var answer = [Int]()
        var index = -1
        
        for i in 0..<pick {
            var max = 0
            for j in index+1...i+k {
                if max < array[j] {
                    index = j
                    max = array[j]
                    if max == 9 {
                        break
                    }
                }
            }
            answer.append(max)
        }
        
        return answer.map{ String($0) }.joined()
    }
}
