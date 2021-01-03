//
//  멀쩡한사각형.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 멀쩡한사각형 {
    func solution(_ w:Int, _ h:Int) -> Int64{
        var answer = Int64(w * h - (w+h-gcd(w, h)))
        print(answer)
        return answer
    }
    
    func gcd(_ x: Int,_ y: Int) -> Int {
        if (y == 0) {
            return x
        }
        return gcd(y, x%y)
    }
}
