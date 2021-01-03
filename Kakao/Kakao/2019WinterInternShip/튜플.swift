//
//  튜플.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class Tuple {
    func solution2(_ s: String) -> [Int] {
        
        // 맨 앞, 맨 뒤 괄호 제거
        var str = s
        str.removeFirst()
        str.removeLast()
        
        // {2},{2,1},{2,1,3},{2,1,3,4}
        let size = str.filter{ $0 == "}" }.count
        var result = Array(repeating: [Int](), count: size)
        let strArray = Array(str)
        
        var num = ""
        var array = [Int]()
        var idx = 0
        
        for (index, value) in strArray.enumerated() {
            if value == "{" {
                
            } else if value == "}" {
                 array.append(Int(num)!)
            } else if value == "," {
                 
                if strArray[index - 1] == "}" && strArray[index + 1] == "{" {
                    result[idx] = array
                    array = []
                    idx += 1
                } else {
                    array.append(Int(num)!)
                }
                num = ""
                
            } else {
                num += String(value)
            }
        }
        result[idx] = array
        result.sort(by: { $0.count < $1.count})
        
        
        var tuples = [Int]()
        for elements in result {
            if let next = elements.first(where: { !tuples.contains($0) }) {
                tuples.append(next)
            }
        }

        print(tuples)
        
        return tuples
    }
    
    func solution(_ s:String) -> [Int] {
        
        var result = [Int]()
        
        var str = s
        str.removeFirst()
        str.removeLast()
        
        let strArray = Array(str)
        var tempStr = [String]()
        
        if strArray.count == 1 {
            str = str.replacingOccurrences(of: "{", with: "")
            str = str.replacingOccurrences(of: "}", with: "")
            
            tempStr.append(str)
        } else {
            var num = ""
            print(strArray)
            for (index, value) in strArray.enumerated() {
//                print(value)
                if value == "," && strArray[index - 1] == "}" && strArray[index + 1] == "{" {
//                    print(num)
                    tempStr.append(num)
                    num = ""
                } else {
                    if value != "{" || value != "}" {
                        if value == "," {
                            tempStr.append(num)
                            num = ""
                        } else {
                            if let number = Int(value.description) {
                                num += value.description
                                print(num)
                            }
                        }
                    }
                }
                print(tempStr)
            }
            tempStr.append(num)
        }
        
        tempStr = tempStr.sorted(by: { $0.count < $1.count })
//        print(tempStr)
        result.append(Int(tempStr[0])!)
        
        for (index, value) in tempStr.enumerated() {
            let sortedValue = String(value.sorted(by: { Int($0.description)! < Int($1.description)!}))
            tempStr[index] = sortedValue
        }
//        print(tempStr)
        for (index, value) in tempStr.enumerated() {
            if index != 0 {
                let num = value.replacingOccurrences(of: tempStr[index - 1], with: "")
                
                if let strToInt = Int(num) {
                    result.append(strToInt)
                }
            }
        }
        print(result)
        
        return result
    }
}
