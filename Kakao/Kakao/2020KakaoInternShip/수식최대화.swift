//
//  수식최대화.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

// 정규표현식으로 expression 잘라주기
// 순열공식으로 연산자 우선순위 구하기
// 우선순위에 따라 값 계산 후 다시 배열에 넣기
// 100-200*300-500+20

class 수식최대화 {
    func solution(_ expression:String) -> Int64 {
        
        let operators = [["+", "-", "*"],
                         ["-", "+", "*"],
                         ["+", "*", "-"],
                         ["*", "-", "+"],
                         ["*", "+", "-"],
                         ["-", "*", "+"]]
        
        var results = [Int]()
        let array = Array(expression)

        var expressionArray = [String]()
        var str = ""
        for data in array {
            if data == "+" || data == "-" || data == "*" {
                expressionArray.append(str)
                expressionArray.append(String(data))
                str = ""
            } else {
                str += String(data)
            }
        }
        expressionArray.append(str)
        let tmp = expressionArray

        for sets in operators {
            for op in sets {
                while expressionArray.contains(op) {

                    let index = expressionArray.firstIndex(of: op)!

                    let num1 = Int(expressionArray[index-1])!
                    let num2 = Int(expressionArray[index+1])!
                    var newValue = 0

                    if op == "+" {
                        newValue = num1 + num2
                    } else if op == "-" {
                        newValue = num1 - num2
                    } else if op == "*" {
                        newValue = num1 * num2
                    }

                    expressionArray[index - 1] = String(newValue)
                    expressionArray.removeSubrange(index...index+1)
                    print(expressionArray)
                }
            }
            results.append(abs(Int(expressionArray.first!)!))
            expressionArray = tmp
        }
        
        print(Int64(results.max()!))
        return Int64(results.max()!)
    }
}


