//
//  숫자 문자열과 영단어.swift
//  Kakao
//
//  Created by 박균호 on 2021/07/21.
//

import Foundation

class 숫자문자열과영단어 {
    func solution(_ s:String) -> Int {
        
        let map = ["zero":"0",
                   "one":"1",
                   "two":"2",
                   "three":"3",
                   "four":"4",
                   "five":"5",
                   "six":"6",
                   "seven":"7",
                   "eight":"8",
                   "nine":"9"]
        
        var word = s
        
        map.forEach { key, value in
            while word.contains(key) {
                word = word.replacingOccurrences(of: key, with: value)
            }
        }
        
        print(word)
        
        return Int(word)!
    }
}
