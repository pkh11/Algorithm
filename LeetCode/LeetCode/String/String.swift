//
//  String.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class _String {
    
    func numUniqueEmails(_ emails: [String]) -> Int {
        // ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        
        // . 은 무시 (이름만)
        // + 뒤에는 삭제
        
        var set = Set<String>()
        
        for email in emails {
            let splits = email.split(separator: "@")
            let localName = splits[0]
            let domainName = splits[1]
            localName.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
            var str = localName
            if localName.contains(".") {
                str = localName.filter{ $0 != "." }
            }
            
            if str.contains("+") {
                str.removeSubrange(str.firstIndex(of: "+")!..<str.endIndex)
            }
            
            let newEmail = "\(str)@\(domainName)"
            set.insert(newEmail)
        }
        
//        print(set)
        
        return set.count
    }
    
    func romanToInt(_ s: String) -> Int {
    
        let map = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let chars = Array(s)

        var total = 0
        var prev = Int.max

        for c in chars  {
            if let currValue = map[String(c)] {
                if (currValue > prev) {
                    total += currValue - prev - prev
                }
                else {
                    total += currValue
                }
                prev = currValue
            }
        }
        
        print(total)

        return total
    }
    
    
    func reverseString(_ s: inout [Character]) {
        s.reverse()
    }
    
    func countAndSay(_ n: Int) -> String {
        
        guard n > 1 else { return "1" }
        
        var count = 0
        var tmp = Character(" ")
        var say = ""
        
        for char in countAndSay(n-1) {
            if char == tmp {
                count += 1
            } else {
                if count > 0 {
                    say += "\(count)\(tmp)"
                }
                
                tmp = char
                count = 1
            }
        }
        
        return say + "\(count)\(tmp)"
    }
    
    func _countAndSay(_ index: Int,_ n: Int,_ str: String) {
        
        if index == n {
            print(str)
        } else {
            var count = 1
            var array = Array(str)
            var newStr = ""
            for i in 1..<array.count {
                if array[i] == array[i-1] {
                    count += 1
                    if i == array.count - 1 {
                        newStr += "\(count)\(array[i-1])"
                    }
                } else {
                    newStr += "\(count)\(array[i-1])"
                    if count == 1 {
                        
                    } else {
                        
                    }
                    count = 1
                }
                
                
            }
        }
        
    }
    
    
    
    func toLowerCase(_ str: String) -> String {
        return str.lowercased()
    }
    
    func detectCapitalUse(_ word: String) -> Bool {
        
        if isAllCapitals(word) || isAllNotCapitals(word) || isFirstWordCapital(word) {
            return true
        }
    
        return false
    }
    
    func isFirstWordCapital(_ word: String) -> Bool {
        var _word = word
        let firstWord = _word.removeFirst()
        let otherWords = _word
        
        if (firstWord >= "A" && firstWord <= "Z") {
            if isAllNotCapitals(otherWords) {
                return true
            }
            return false
        }
        return false
    }
    
    func isAllNotCapitals(_ word: String) -> Bool {
        for str in word {
            if !(str >= "a" && str <= "z") {
                return false
            }
        }
        return true
    }
    
    func isAllCapitals(_ word: String) -> Bool {
        for str in word {
            if !(str >= "A" && str <= "Z") {
                return false
            }
        }
        return true
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let sorted = strs.sorted(by: {$0.count < $1.count})
        guard !sorted.isEmpty else { return "" }

        var longestComPrefix = sorted[0]
        
        for index in 1..<sorted.count {
            let item = sorted[index]
            longestComPrefix = longestComPrefix.commonPrefix(with: item)
        }
        
        return longestComPrefix
    }
}
