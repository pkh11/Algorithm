//
//  1주차_부족한금액계산하기.swift
//  Kakao
//
//  Created by 박균호 on 2021/10/05.
//

import Foundation

class Week1 {
    func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
        var answer:Int64 = -1
        var sum = 0
        
        for i in 1...count {
            sum += price * i
        }
        
        if sum < money {
            return 0
        }
        
        answer = Int64(sum) - Int64(money)
        
        return answer
    }
}
