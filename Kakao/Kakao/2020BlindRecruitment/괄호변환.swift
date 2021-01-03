//
//  괄호변환.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

/*
1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
  4-3. ')'를 다시 붙입니다.
  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
  4-5. 생성된 문자열을 반환합니다.
*/

/*
 
 "(()())()"    "(()())()"
 ")("          "()"
 "()))((()"    "()(())()"
 
 */

class 괄호변환 {
    // (()())()
    //
    // w.first (
    // flag = 1 2 1 2 1 0
    func solution(_ p:String) -> String {
        if p.isEmpty { return  "" }
        return seperateBracket(p)
    }
    
    func seperateBracket(_ brackets: String) -> String {
        
        if isCorrectBracket(brackets) { return brackets }
        
        var w = brackets
        var u = String(w.removeFirst())
        var v = w
        
        // 문자 한개씩 붙여서 균형잡힌 문자열 체크
        while true {
            let target = String(v.removeFirst())
            u += target
            if isBalancedBracket(u) { break }
        }
        
        // 올바른 문자열 체크
        if isCorrectBracket(u) {
            return u + seperateBracket(v)
        } else {
            return "(\(seperateBracket(v)))" + transformBracket(u)
        }
    }
    // 문자열 변형
    func transformBracket(_ brackets: String) -> String {
        var target = brackets
        target.removeFirst()
        target.removeLast()
        
        let arrays = Array(target)
        var empty = ""
        
        for i in 0..<arrays.count {
            if arrays[i] == "(" {
                empty += ")"
            } else {
                empty += "("
            }
        }
        return empty
    }
    // 균형잡힌 문자열 판단
    func isBalancedBracket(_ brackets: String) -> Bool {
        
        var leftBracket = 0
        var rightBracket = 0
        
        for bracket in brackets {
            if bracket == "(" {
                leftBracket += 1
            } else {
                rightBracket += 1
            }
        }
        
        return leftBracket == rightBracket ? true : false
    }
    
    // 올바른 문자열 판단
    func isCorrectBracket(_ brackets: String) -> Bool {
        
        var count = 0
        
        for char in brackets {
            if count < 0 { return false }
            if char == "(" {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return count == 0
    }
}


