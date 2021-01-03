//
//  영어끝말잇기.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 영어끝말잇기 {
    
    func solution2(_ n:Int, _ words:[String]) -> [Int] {
        
        var set = [String]()
        var beforeWord: String = ""
        
        for word in words {
            if set.contains(word) {
                // set.count % n : 몇번째 사람인지 (index는 0부터 시작해서 +1 더해줌)
                // set.count / n : 몇번째 차례인지
                return [set.count % n + 1, set.count / n + 1]
            } else {
                if let firstWord = word.first,
                   let lastOfBeforeWord = beforeWord.last {
                    if firstWord != lastOfBeforeWord {
                        return [set.count % n + 1, set.count / n + 1]
                    }
                }
            }
            set.append(word)
            beforeWord = word
        }
        
        return [0, 0]
    }
    
    func solution(_ n:Int, _ words:[String]) -> [Int] {
        
        // 중복체크
        // 앞문자로 시작하는지 체크
        var result = [Int]()
        var set = [String]()
        var lastWord = words[0].last!
        var target = 0
        
        set.append(words[0])
        
        for (index, word) in words.enumerated() {
            if index >= 1 {
                let firstWord = word.first!
                if set.contains(word) || lastWord != firstWord {
                    target = index + 1
                    break
                }
                set.append(word)
                lastWord = word.last!
            }
        }
        var people = 0
        var order = 0
        // 몇번째 사람인지
        if target%n == 0 {
            if target == 0 {
                people = 0
            } else {
                people = n
            }
            order = target/n
        } else {
            people = target%n
            order = target/n + 1
        }
        result.append(people)
        result.append(order)
        print(result)
        
        return result
    }
}
