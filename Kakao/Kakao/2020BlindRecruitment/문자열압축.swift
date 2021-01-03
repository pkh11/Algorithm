//
//  문자열압축.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 문자열압축 {
    func solution(_ s:String) -> Int {
        if s.count == 1 { return 1 }
        
        var compressions = [Int]()
        for i in 1...s.count / 2 {
            compressions.append(compression(s, i))
        }
        
        return compressions.min()!
    }

    func compression(_ str: String, _ cutSize: Int) -> Int {
        
        var compressions = [String]() // 자른 문자열 담는 배열
        var results = [String]() // 결과 담는 배열
        var countOfCompressions = 0 // 문자열을 몇번 잘랐는지
        var countOfRemain = 0 // 문자열 자르고 남는 문자열
        var countOfWords = 0 // 중복된 문자열 갯수
        var word = ""
        
        // 자를 단어 갯수와 잔여 단어 갯수 구하기
        countOfCompressions = str.count / cutSize
        
        if str.count % cutSize != 0 {
            countOfRemain = str.count % cutSize
        }
        
        var firstIndex = str.index(str.startIndex, offsetBy: 0)
        var lastIndex = str.index(str.startIndex, offsetBy: 0)
        
        // 문자열 자르기
        for _ in 0..<countOfCompressions {
            lastIndex = str.index(lastIndex, offsetBy: cutSize)
            compressions.append(String(str[firstIndex..<lastIndex]))
            firstIndex = lastIndex
        }
        
        for i in 0..<compressions.count {
            if word == "" {
                word = compressions[i]
                countOfWords += 1
            } else {
                if word == compressions[i] {
                    countOfWords += 1
                } else {
                    if countOfWords == 1 {
                        results.append("\(word)")
                    } else {
                        results.append("\(countOfWords)\(word)")
                    }
                    word = compressions[i]
                    countOfWords = 1
                }
            }
        }
        
        // 뒤에 잔여 문자열
        if countOfWords == 1 {
            results.append("\(word)")
        } else {
            results.append("\(countOfWords)\(word)")
        }
        
        return results.joined().count + countOfRemain
    }
}
