//
//  no3.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/15.
//

import Foundation

class KaKaoEnterpriseNo3 {
    func minOperations(n: Int) -> Int {
        let digit = String(n, radix: 2)
        let digitToArray = Array(digit)
        let size = digitToArray.count
        var bools = Array(repeating: false, count: size)
        
        for i in 0..<digitToArray.count {
            if digitToArray[i] == "1" {
                bools[i] = true
            }
        }
        
        var result = 0
        
        while true {
            print(bools)
            var change = false
            for i in 0..<size-1 {
                if bools[i+1] {
                    if i+1 == size - 1 {
                        bools[i] = !bools[i]
                        result += 1
                        change = true
                        continue
                    } else {
                        if !bools[i+2..<size].contains(true) {
                            bools[i] = !bools[i]
                            result += 1
                            change = true
                            continue
                        }
                    }
                } else {
                    if i+1 == size - 1 {
                        bools[i] = !bools[i]
                        result += 1
                        change = true
                        continue
                    } else {
                        if !bools[i+2..<size].contains(true) {
                            bools[i] = !bools[i]
                            result += 1
                            change = true
                            continue
                        }
                    }
                }
//                print(bools)
            }
            if !change {
                result += 1
                bools[size-1] = !bools[size-1]
            }
            
            if !bools.contains(true) {
                break
            }
            
        }
        
        print(result)
        return 0
    }
    
    func check(_ str: [Bool]) -> Bool {
        var flag = true
        for i in 0..<str.count-2 {
            if str[i+1] {
                if i+1 == str.count - 1 {
                    return true
                } else {
                    if str[i+2...str.count-1].contains(true) {
                        flag = false
                        continue
                    } else {
                        flag = true
                        return flag
                    }
                }
            }
        }
        return flag
    }
}
