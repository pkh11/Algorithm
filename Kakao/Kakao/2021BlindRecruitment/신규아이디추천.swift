//
//  신규아이디추천.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/03.
//

import Foundation

class 신규아이디추천 {
    func solution(_ new_id:String) -> String {
        
        // step1.
        var newID = new_id.lowercased()
        
        // step2.
        newID = newID.filter {
            if $0 == "_" || $0 == "-" || $0 == "." || ($0 >= "0" && $0 <= "9") || ($0 >= "a" && $0 <= "z") {
                return true
            }
            return false
        }
        
        // step3.
        var temp = ""
        var dot = ""
        for value in newID {
            if value == "." {
                dot += String(value)
            } else {
                // 점갯수가 2이상일 경우 "." 하나로 표시
                if !dot.isEmpty {
                    temp += "."
                    dot = ""
                }
                temp += String(value)
            }
        }
        newID = temp
        
        // step4.
        
        if let first = newID.first, let last = newID.last {
            if first == "." {
                newID.removeFirst()
            }
            if last == "." {
                newID.removeLast()
            }
        }
        
        // step5.
        if newID.isEmpty {
            newID = "a"
        }
        
        // step 6.
        if newID.count >= 16 {
            let startIndex = newID.startIndex
            let lastIndex = newID.index(newID.startIndex, offsetBy: 14)
            newID = newID[startIndex...lastIndex].map{ String($0) }.joined()
            if let last = newID.last {
                if last == "." {
                    newID.removeLast()
                }
            }
        }
        
        // step7.
        if newID.count <= 2 {
            if let last = newID.last {
                while newID.count <= 2 {
                    newID.append(last)
                }
            }
        }
//        print(newID)
        return newID
    }
}
