//
//  뉴스클러스터링.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 뉴스클러스터링 {
    // FRANCE
    // french
    func solution(_ str1:String, _ str2:String) -> Int {
        
        let _str1 = str1.lowercased().map{ $0 }
        let _str2 = str2.lowercased().map{ $0 }
        
        var str1Array = [String]()
        var str2Array = [String]()
        
        var intersection = [String]()
        var union = [String]()
        
        for i in 0..<_str1.count {
            let step = i + 1
            if step <= _str1.count - 1 {
                let str = _str1[i...step]
                
                if isValidate(with: str.first!) && isValidate(with: str.last!) {
                    let element = "\(str.first!)\(str.last!)"
                    str1Array.append(element)
                }
            }
        }
        
        for i in 0..<str2.count {
            let step = i + 1
            if step <= _str2.count - 1 {
                let str = _str2[i...step]
                
                if isValidate(with: str.first!) && isValidate(with: str.last!) {
                    let element = "\(str.first!)\(str.last!)"
                    str2Array.append(element)
                    
                    if str1Array.contains(element) {
                        intersection.append(element)
                        str1Array.remove(at: str1Array.firstIndex(of: element)!)
                        str2Array.remove(at: str2Array.firstIndex(of: element)!)
                    }
                }
                
            }
        }
        
        union = str1Array + str2Array + intersection
        
        if intersection.isEmpty && union.isEmpty {
            return 65536
        } else {
            let jaccard: Double = Double(intersection.count) / Double(union.count) * 65536
            return Int(jaccard)
        }
    }
    
    func isValidate(with str: Character) -> Bool {
        return str >= "a" && str <= "z"
    }
    
    func isValidateString(with str: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[a-z]", options: .caseInsensitive)
            let result = regex.matches(in: str, range: NSRange(location: 0, length: str.count))
            
            return result.map{ String(str[Range($0.range, in: str)!]) }.count == 2 ? true : false
        } catch let error {
            print("invalid reges \(error)")
            return false
        }
    }
}
extension String {
    func isRegex(words: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: "[a-z]", options: .caseInsensitive)
            let result = regex.matches(in: words, range: NSRange(self.startIndex..., in: self))
            
            return result.map{ String(self[Range($0.range, in: self)!])}
        } catch let error {
            print("invalid reges \(error)")
            return []
        }
    }
}
