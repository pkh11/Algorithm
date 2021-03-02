//
//  String.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class _String {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        let str = String(x)
        let reversed = str.reversed().map{ String($0) }.joined()
        
//        print("str : \(str)")
//        print("reversed : \(reversed)")
        
        if str.elementsEqual(reversed) {
            return true
        }
        
        return false
    }
    
    func thousandSeparator(_ n: Int) -> String {
                
        let str = String(n).map{ String($0) }
        let size = str.count - 1
        var new = ""
        
        for i in stride(from: size, through: 0, by: -1) {
            let index = size - i
            if index % 3 == 0 && index != 0 {
                new += ".\(String(str[i]))"
            } else {
                new += "\(String(str[i]))"
            }
        }

        new = new.reversed().map{ String($0) }.joined()
        print(new)
        return new
    }
    
    func addBinary(_ a: String, _ b: String) -> String {
        // 2진수(string) -> 10진수(int)
//        let _a = Int64(a, radix: 2)!
//        let _b = Int64(b, radix: 2)!
        // 10진수(int) -> 2진수(string)
//        let _c = String(_a + _b, radix: 2)
        
        var a = a
        var b = b
        var carry = 0
        var result = ""
        
        while !a.isEmpty || !b.isEmpty || carry > 0 {
            let x = Int(a.isEmpty ? "0" : String(a.removeLast()))!
            let y = Int(b.isEmpty ? "0" : String(b.removeLast()))!
            let sum = x + y + carry
            result = String(sum % 2) + result
            carry = sum / 2
        }
        
        return result
    }
    
    func lengthOfLastWord(_ s: String) -> Int {
        
        let splited = s.split(separator: " ")
        
        guard !splited.isEmpty else { return 0 }
        
        if let lastWord = splited.last {
            return lastWord.count
        }
        
        return 0
    }
    
    func firstUniqChar(_ s: String) -> Int {
        
        var dic = [Character:Int]()
        
        for char in s {
            dic[char] = (dic[char] ?? 0) + 1
        }
        
        for char in s {
            if dic[char] == 1 {
                return (s.firstIndex(of: char)?.encodedOffset)!
            }
        }
        
        return -1
    }
    
    func freqAlphabets(_ s: String) -> String {
        var _s = s
        let map = ["1":"a", "2":"b", "3":"c", "4":"d", "5":"e", "6":"f", "7":"g", "8":"h", "9":"i"]
        let code = ["10#":"j", "11#":"k", "12#":"l", "13#":"m", "14#":"n", "15#":"o", "16#":"p",
                    "17#":"q", "18#":"r", "19#":"s", "20#":"t", "21#":"u", "22#":"v", "23#":"w", "24#":"x", "25#":"y", "26#":"z"]
        
        while true {
            if _s.contains("#") {
                let firstIndex = _s.firstIndex(of: "#")!
                let index1 = _s.index(firstIndex, offsetBy: -1)
                let index2 = _s.index(firstIndex, offsetBy: -2)
                
                let key = "\(_s[index2])" + "\(_s[index1])" + "\(_s[firstIndex])"
                _s = _s.replacingOccurrences(of: key, with: code["\(key)"]!)
                
            } else {
                for char in _s {
                    if char >= "1" && char <= "9" {
                        _s = _s.replacingOccurrences(of: String(char), with: map["\(char)"]!)
                    }
                }
                break
            }
        }
        
        return _s
    }
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        let ransomChars = Array(ransomNote)
        let magazineChars = Array(magazine)
        var dict = [Character: Int]()
        
        for char in magazineChars {
            if let value = dict[char] {
                dict[char] = value + 1
            } else {
                dict[char] = 1
            }
        }
        
        print(dict)
        
        for char in ransomChars {
            if let value = dict[char] {
                if value - 1 < 0 {
                    return false
                }
                dict[char] = value - 1
            } else {
                return false
            }
        }
        
        return true
    }
    
    func maxNumberOfBalloons(_ text: String) -> Int {
        // balloon
        var priority: [String:Int] = ["b":0, "a":0, "l":0, "o":0, "n":0]
        
        for char in text {
            if let count = priority["\(char)"] {
                priority["\(char)"] = count + 1
            }
        }
        
        if priority["o"]! % 2 == 1 {
            priority["o"] = priority["o"]! - 1
        }
        
        if priority["l"]! % 2 == 1 {
            priority["l"] = priority["l"]! - 1
        }
        
        return min(priority["b"]!, priority["a"]!, priority["l"]!/2, priority["o"]!/2, priority["n"]!)
    }
    
    func isValid(_ s: String) -> Bool {
        
        let array = s.map{ String($0) }
        var stack = [String]()
        
        for char in array {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if !stack.isEmpty {
                    let top = stack.last!
                    
                    if top == "(" && char == ")" {
                        stack.removeLast()
                    } else if top == "{" && char == "}" {
                        stack.removeLast()
                    } else if top == "[" && char == "]" {
                        stack.removeLast()
                    } else {
                        stack.append(char)
                    }
                } else {
                    stack.append(char)
                }
            }
        }
        
        if stack.isEmpty {
            return true
        }
        
        return false
    }
    
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
    
    func reverseWords(_ s: String) -> String {
        
        let splited = s.split(separator: " ").map{ String($0).reversed() }.map{ String($0) }
        
        return splited.joined(separator: " ")
    }
    
    // "a, a, a, a, b,b,b,c, c"
    // ["a"]
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        
        var countOfWords = [String:Int]()
        var filterdWords = [String]()
        let words = paragraph.lowercased().map{ String($0) }
        //        print(words)
        var tmp = ""
        for (index, word) in words.enumerated() {
            if word == " " ||
                word == "!" ||
                word == "?" ||
                word == "'" ||
                word == "." ||
                word == ";" ||
                word == "," {
                filterdWords.append(tmp)
                tmp = ""
            } else {
                tmp += word
                if index == words.count - 1 {
                    filterdWords.append(tmp)
                }
            }
        }
        
        for word in filterdWords {
            if let key = countOfWords[word] {
                countOfWords[word] = key + 1
            } else {
                countOfWords[word] = 1
            }
        }
        
        for bannedWord in banned {
            countOfWords = countOfWords.filter({ $0.key != bannedWord })
        }
        
        let answer = countOfWords.sorted(by: { $0.value > $1.value }).map{ $0.key }.filter({ $0 != "" })
        
        if let word = answer.first {
            return word
        }
        
        return ""
    }
    
    func numUniqueEmails(_ emails: [String]) -> Int {
        // ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
        
        // . 은 무시 (이름만)
        // + 뒤에는 삭제
        
        var set = Set<String>()
        
        for email in emails {
            let splits = email.split(separator: "@")
            let localName = splits[0]
            let domainName = splits[1]
            
            let numbers = "+1(202)-505- 71-17".replacingOccurrences(of: "\\W", with: "", options: .regularExpression)
            
            print(numbers)
            
            
            //            localName.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
            
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
