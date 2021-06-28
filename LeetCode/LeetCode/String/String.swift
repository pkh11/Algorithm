//
//  String.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class _String {
    
    func findTheDifference(_ s: String, _ t: String) -> Character {
        
        var mapByS = [String: Int]()
        var mapByT = [String: Int]()
        var result = ""
        
        for char in s {
            if let value = mapByS[String(char)] {
                mapByS[String(char)] = value + 1
            } else {
                mapByS[String(char)] = 1
            }
        }
        
        for char in t {
            if let value = mapByT[String(char)] {
                mapByT[String(char)] = value + 1
            } else {
                mapByT[String(char)] = 1
            }
        }
        
        for char in t {
            if !mapByS.contains(where: { $0.key == String(char) }) {
                result = String(char)
            } else {
                let countOfS = mapByS[String(char)]
                let countOfT = mapByT[String(char)]
                
                if countOfS != countOfT {
                    result = String(char)
                }
            }
        }
        
        return Character(result)
    }
    
    func numDecodings(_ s: String) -> Int {
        
        let map = ["1":"A","2":"B","3":"C","4":"D","5":"E","6":"F","7":"G",
                   "8":"H","9":"I","10":"J","11":"K","12":"L","13":"M","14":"N","15":"O",
                   "16":"P","17":"Q","18":"R","19":"S","20":"T","21":"U","22":"V","23":"W","24":"X","25":"Y","Z":"26"]
        
        // 12
        // 226
        // 06
        
        return 0
    }
    
    func countSegments(_ s: String) -> Int {
        return s.split(separator: " ").count
    }
    
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
//        Given a list of strings words and a string pattern, return a list of words[i] that match pattern. You may return the answer in any order.
//        A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.
//        Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.

        var result = [String]()
        var pattern = pattern.map{ String($0) }
        
        for word in words {
            var map = [String:String]()
            var set = Set<String>()
            
            let array = word.map{ String($0) }
            var isTrue = true
            for i in 0..<array.count {
                if let value = map[pattern[i]] {
                    if value != array[i] {
                        isTrue = false
                    }
                } else {
                    map[pattern[i]] = array[i]
                    if set.contains(array[i]) {
                        isTrue = false
                    }
                    set.insert(array[i])
                }
            }
            
            if isTrue {
                result.append(word)
            }
        }

        print(result)
        
        return result
    }
    
    func largestNumber(_ nums: [Int]) -> String {
        
        let x = nums.reduce(0, +)
        
        if x == 0 {
            return "0"
        }
        
        var array = nums.sorted {
            let num1 = "\($0)\($1)"
            let num2 = "\($1)\($0)"
            
            return num1 > num2
        }
        
//        print(array.map{ String($0)})
        
        return array.map{ String($0)}.joined()
    }
    
    func decodeString(_ s: String) -> String {
        
        var num = 0
        var result = ""
        var stack = [(String, Int)]()
        
        for char in s {
            switch char {
            case "[":
                stack.append((result, num))
                num = 0
                result = ""
            case "]":
                let (prev, num) = stack.removeLast()
                result = prev + String(repeating: result, count: num)
            case _ where char.isNumber:
                num *= 10
                num += Int(String(char))!
            default:
                result += String(char)
            }
        }
        
        return result
    }
    
    func letterCombinations(_ digits: String) -> [String] {
//        Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//
//        A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
        
        guard digits.isEmpty else { return [] }
        
        let map = ["2":["a","b","c"],
                   "3":["d","e","f"],
                   "4":["g","h","i"],
                   "5":["j","k","l"],
                   "6":["m","n","o"],
                   "7":["p","q","r","s"],
                   "8":["t","u","v"],
                   "9":["w","x","y","z"],
                   "1":[]]
        
        var result = [""]
        
        for digit in digits {
            let values = map[String(digit)]!
            var temp = [String]()
            
            for value in values {
                temp.append(contentsOf: result.map{ $0 + value })
            }
            
            result = temp
        }
        print(result)
        
        return result
    }
    
    func sortSentence(_ s: String) -> String {
        let array = s.split(separator: " ")
        
        var sentences = [(String,Int)]()
        var map = [String:Int]()
        
        for sentence in array {
            var str = String(sentence)
            let number = String(str.removeLast())
            sentences.append((str,Int(number)!))
//            map[str] = Int(number)
        }
        var result = sentences.sorted { $0.1 < $1.1 }.map{ $0.0 }.joined(separator: " ")
//        var result = map.sorted { $0.value < $1.value }.map{ $0.key }.joined(separator: " ")
        print(result)
        
        return result
    }
    
    func reverseVowels(_ s: String) -> String {        
        var stack = [Character]()
        
        for char in s {
            if char == "a" || char == "A" ||
                char == "e" || char == "E" ||
                char == "i" || char == "I" ||
                char == "o" || char == "O" ||
                char == "u" || char == "U" {
                stack.append(char)
            }
        }
        var str = ""
        
        for char in s {
            if char == "a" || char == "A" ||
                char == "e" || char == "E" ||
                char == "i" || char == "I" ||
                char == "o" || char == "O" ||
                char == "u" || char == "U" {
                if let last = stack.popLast() {
                    str += String(last)
                }
            } else {
                str += String(char)
            }
        }
        print(str)
        
        return str
    }
    
    func repeatedSubstringPattern(_ s: String) -> Bool {
        // abcabc
        // aba
        // abab
        
        guard s.count > 1 else { return false }
        
        var str = s
        var map = [Character:Int]()
        var pattern = ""
        
        for char in s {
            if let value = map[char] {
                map[char] = value + 1
//                str.split(separator: <#T##Character#>)
            } else {
                pattern += String(char)
                map[char] = 1
            }
        }
        
        return true
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count == needle.count {
            return haystack != needle ? -1 : 0
        } else if let range = haystack.range(of: needle) {
            print(haystack[haystack.startIndex..<range.lowerBound])
            return haystack[haystack.startIndex..<range.lowerBound].count
        } else {
            return needle.isEmpty ? 0 : -1
        }
    }
    
    func restoreIpAddresses(_ s: String) -> [String] {
        // 255 255 111 35 -> 11개
        // 010010 -> 6개
        
        let array = Array(s)
        var result = [String]()
        
        guard array.count >= 4 else {
            return []
        }
        
        for i in 1...3 {
            if isNumber(array[0..<i]) && i <= array.count {
                for j in i...i+3 {
                    if j <= array.count && isNumber(array[i..<j]) {
                        for k in j...j+3 where k <= array.count {
                            if isNumber(array[j..<k]) && isNumber(array[k..<array.count]) {
                                let nums = [0..<i, i..<j, j..<k, k..<s.count].map{ String(array[$0]) }
                                result.append(nums.joined(separator: "."))
                            }
                        }
                    }
                }
            }
        }
        print(result)
        
        return result
    }
    
    func isNumber(_ slice: ArraySlice<Character>) -> Bool {
        let str = String(slice)
        
        if str.first == "0" {
            if str == "0" {
                return true
            } else {
                return false
            }
        } else {
            guard let num = Int(str) else { return false }
            return num >= 0 && num <= 255
        }
    }
    
    
    
    func checkIfPangram(_ sentence: String) -> Bool {
            
        var map = [Character:Int]()
        
        for char in sentence {
            if let value = map[char] {
                map[char] = value + 1
            } else {
                map[char] = 1
            }
        }
        if map.keys.count == 26 {
            return true
        }
        
        return false
    }
    
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
//        num = [1,2,0,0], k = 34
        var k = k
        var result = ""
        
        while k != 0 {
            result.insert(contentsOf: String(k % 10), at: result.startIndex)
            k = k / 10
        }
        
        var array1 = num
        var array2 = Array(result)
        
        let size1 = array1.count
        let size2 = array2.count
        var index = 0
        
        if array1.count > array2.count {
            index = size1
            for _ in 0..<size1-size2 {
                array2.insert("0", at: 0)
            }
        } else {
            index = size2
            for _ in 0..<size2-size1 {
                array1.insert(0, at: 0)
            }
        }
        
        var answer = [Int]()
        var next = 0
        for i in stride(from: index-1, through: 0, by: -1) {
            let sum = array1[i] + Int(String(array2[i]))! + next
            
            if sum / 10 == 1 {
                next = 1
                answer.insert(sum%10, at: 0)
            } else {
                next = 0
                answer.insert(sum, at: 0)
            }
        }
        
        if next == 1 {
            answer.insert(next, at: 0)
        }
        
        print(answer)
        
        return []
    }
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        var array1 = Array(num1)
        var array2 = Array(num2)
        let countOfnum1 = array1.count
        let countOfnum2 = array2.count
        var index = 0
        var gap = 0
        
        if countOfnum1 > countOfnum2 {
            index = countOfnum1 - 1
            gap = countOfnum1 - countOfnum2
            for _ in 0..<gap {
                array2.insert("0", at: 0)
            }
        } else {
            index = countOfnum2 - 1
            gap = countOfnum2 - countOfnum1
            for _ in 0..<gap {
                array1.insert("0", at: 0)
            }
        }
        
        var result = ""
        var next = 0
        for i in stride(from: index, through: 0, by: -1) {
            let sum = Int(String(array1[i]))! + Int(String(array2[i]))! + next
            
            if sum / 10 == 1 {
                next = 1
                result.insert(contentsOf: "\(sum % 10)", at: result.startIndex)
            } else {
                next = 0
                result.insert(contentsOf: "\(sum)", at: result.startIndex)
            }
        }
        
        if next == 1 {
            result.insert(contentsOf: "\(next)", at: result.startIndex)
        }
        
        print(result)
        return ""
    }
    
    // 다시풀기
    // https://leetcode.com/problems/rearrange-spaces-between-words/
    func reorderSpaces(_ text: String) -> String {
        //"  hello"
        let array = text.split(separator: " ")
        let numberOfWords = array.count
        var numberOfSpaces = 0
        
        for char in text {
            if !char.isLetter {
                numberOfSpaces += 1
            }
        }
        
        var possibleSpaces = 0
        var extraSpaces = 0
        
        if numberOfWords == 1 {
            possibleSpaces = numberOfSpaces
            extraSpaces = numberOfSpaces
        } else {
            possibleSpaces = numberOfSpaces / (numberOfWords - 1)
            extraSpaces = numberOfSpaces % (numberOfWords - 1)
        }
    
        var result = ""
        
        for (index, word) in array.enumerated() {
            result += word
            if index != array.count - 1 {
                for _ in 0..<possibleSpaces {
                    result += " "
                }
            }
        }
        
        for _ in 0..<extraSpaces {
            result += " "
        }
        print(result)
        
        return result
    }
    
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
//        string.camelMatch(["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], "FoBaT")

        var answer: [Bool] = []
        let patternArray = Array(pattern)
        
        for query in queries {
            var index = 0
            var isMatching = true
            
            for char in query {
                if index < patternArray.count && char == patternArray[index] {
                    index += 1
                } else if char.isUppercase {
                    isMatching = false
                    break
                }
            }
            isMatching = isMatching && index == patternArray.count
            answer.append(isMatching)
        }
        
        print(answer)

        return answer
    }
    
    func numSplits(_ s: String) -> Int {
        // 시간초과나서 딕셔너리로 품
        
        let distinct = Set(s).count
        if distinct == 1 {
            return s.count - 1
        }
    
        if distinct == s.count {
            if distinct % 2 == 0 {
                return 1
            } else {
                return 0
            }
        }
        
        var leftSet = [Character:Int]()
        var rightSet = [Character:Int]()
        var count = 0
        
        for char in s {
            leftSet[char] = (leftSet[char] ?? 0) + 1
        }
        
        for char in s {
            rightSet[char] = (rightSet[char] ?? 0) + 1
            
            if leftSet[char] == 1 {
                leftSet[char] = nil
            } else {
                leftSet[char] = leftSet[char]! - 1
            }
            
            if leftSet.keys.count == rightSet.keys.count {
                count += 1
            }
        }
        
        print(count)
        
        return 0
    }
    
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
