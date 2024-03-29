//
//  _Array.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/05.
//

import Foundation

class _Array {
    
    func findMinDifference(_ timePoints: [String]) -> Int {
        
        var array = [Int]()
        
        for timePoint in timePoints {
            let splited = timePoint.split(separator: ":")

            let hours = splited[0]
            let minutes = splited[1]
            
            let convertHoursByMinutes = Int(hours)! * 60 + Int(minutes)!
            array.append(convertHoursByMinutes)
        }
        
        array = array.sorted(by: <)
        var minGap = 0
        var result = array.max()!
        
        for i in 0..<array.count {
            for j in i+1..<array.count {
                let gap = array[j] - array[i]
                minGap = min(gap, 1440 - gap)
                if minGap == 0 {
                    return minGap
                }
                if result > minGap {
                    result = minGap
                }
            }
        }
        
        print(result)
        
        return result
    }
    
    func majorityElement(_ nums: [Int]) -> Int {
        let size = nums.count
        var map = [Int:Int]()
        
        for num in nums {
            if let value = map[num] {
                map[num] = value + 1
            } else {
                map[num] = 1
            }
        }
        
        let result = map.filter{ $0.value > size/2 }.map{ $0.key }.first!
        
        print(result)
        
        return result
    }
    
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let str = Array(s).map { String($0) }
        let alphabets = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        let size = shifts.count
        let sum = shifts.reduce(0, +)
        var gaps = Array(repeating: 0, count: size)
        var answer = ""
        
        gaps[0] = sum
        for i in 1..<size {
            gaps[i] = gaps[i-1] - shifts[i-1]
        }
        
        for i in 0..<size {
            var index = gaps[i]
            let firstIndex = alphabets.firstIndex(of: str[i])!
            let gap = firstIndex + index
            
            if gap > 26{
               index = gap % 26
            } else {
                index = gap
            }
            
            answer += "\(alphabets[index])"
        }
        
        return answer
    }
    
    func findPeakElement(_ nums: [Int]) -> Int {
        
        let peek = nums.max()!
        let indexOfPeek = nums.firstIndex(of: peek)!
        
        return indexOfPeek
    }
    
    func truncateSentence(_ s: String, _ k: Int) -> String {
        let splited = s.split(separator:" ")
        var answer = s

        if splited.count > k {
            answer = splited[0..<k].joined(separator: " ")
        }
        
        return answer
    }
    
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        
        var setOfSubdomains = [String:Int]()
        
        for cpdomain in cpdomains {
            let time = Int(cpdomain.split(separator: " ")[0])!
            let domain = cpdomain.split(separator: " ")[1]
            
            var subdomains = domain.split(separator: ".")
            
            while !subdomains.isEmpty {
                let joined = subdomains.joined(separator: ".")
                if let value = setOfSubdomains[joined] {
                    setOfSubdomains[joined] = value + time
                } else {
                    setOfSubdomains[joined] = time
                }
                subdomains.removeFirst()
            }
        }
        var result = [String]()
        
        setOfSubdomains.forEach {
            let answer = "\($0.value) \($0.key)"
            result.append(answer)
        }
        
        print(result)
        
        return result
    }
    
    func maxProduct(_ words: [String]) -> Int {
        
        var maxProduct = 0
        
        var words = words.sorted { $0.count > $1.count }
        
        for i in 0..<words.count {
            
            var set1 = Set<String>()
            words[i].map{
                set1.insert(String($0))
            }
            
            next: for j in i+1..<words.count {
                let word2 = words[j]
                
                for char in word2 {
                    if set1.contains(String(char)) {
                        continue next
                    }
                }
                maxProduct = max(maxProduct, words[i].count * word2.count)
            }
        }
        
        print(maxProduct)
        
        return maxProduct
    }
    
    func rankTeams(_ votes: [String]) -> String {
        var map = [String:[Int]]()
        
        for vote in votes {
            let teams = vote.map{ String($0) }
            let count = teams.count
            var index = 0
            
            while index < count {
                if var scores = map[teams[index]] {
                    scores[index] += 1
                    map[teams[index]] = scores
                } else {
                    var array = [Int](repeating: 0, count: count)
                    array[index] = 1
                    map[teams[index]] = array
                }
                index += 1
            }
        }
        
        let result = map.sorted {
            let list1 = $0.value
            let list2 = $1.value
            
            for i in 0..<list1.count {
                if list1[i] != list2[i] {
                    return list1[i] > list2[i]
                }
            }
            return $0.key < $1.key
        }.map{ $0.key }
        
        return result.joined()
    }
    
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        //        [73,74,75,71,69,72,76,73]
        //        [55,38,53,81,61,93,97,32,43,78]
        var answer = [Int](repeating: 0, count: temperatures.count)
        if temperatures.count < 2 { return answer }
        var stack = [Int]()
        
        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[stack.last!] < temperatures[i] {
                let t = stack.removeLast()
                answer[t] = i - t
            }
            stack.append(i)
        }
        
        print(answer)
        return answer
    }
    
    func longestWord(_ words: [String]) -> String {
        
        let words = words.sorted()
        var set = Set<String>()
        var answer = ""
        
        for word in words {
            if word.count == 1 || set.contains(String(word.prefix(word.count-1))) {
                answer = word.count > answer.count ? word : answer
                set.insert(word)
            }
        }
        print(set)
        print(answer)
        
        return answer
    }
    
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        
        var sentences = sentence.split(separator: " ").map{ String($0) }
        
        for word in dictionary {
            for (index, sentence) in sentences.enumerated() {
                if sentence.hasPrefix(word) {
                    sentences[index] = word
                }
            }
        }
        
        print(sentences.joined(separator: " "))
        
        return sentences.joined(separator: " ")
    }
    
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        //        In a warehouse, there is a row of barcodes, where the ith barcode is barcodes[i].
        //        Rearrange the barcodes so that no two adjacent barcodes are equal. You may return any answer, and it is guaranteed an answer exists.
        
        // [1,1,1,2,2,2]
        // [1,1,1,1,2,2,3,3]
        
        var map = [Int: Int]()
        for barcode in barcodes {
            if let value = map[barcode] {
                map[barcode] = value + 1
            } else {
                map[barcode] = 1
            }
        }
        
        let sortedKey = map.keys.sorted { map[$0]! > map[$1]! }
        
        var index = 0
        var rearranged = barcodes
        for i in sortedKey {
            for _ in 0..<map[i]! {
                rearranged[index] = i
                index += 2
                if index >= barcodes.count {
                    index = 1
                }
            }
        }
        
        return rearranged
    }
    
    func waysToMakeFair(_ nums: [Int]) -> Int {
        
        var result = 0
        
        let size = nums.count
        var presumLeft = [Int](repeating: 0, count: 2)
        var presumRight = presumLeft
        
        for i in 0..<size {
            presumRight[i % 2] += nums[i]
        }
        print(presumRight)
        for i in 0..<size {
            presumRight[i % 2] -= nums[i]
            print("right : \(presumRight)")
            if presumLeft[0] + presumRight[1] == presumLeft[1] + presumRight[0] {
                result += 1
            }
            print("left : \(presumLeft)")
            
            presumLeft[i % 2] += nums[i]
            
            
            
        }
        
        print(result)
        
        return result
    }
    
    func findDuplicate(_ nums: [Int]) -> Int {
        
        var map = [Int:Int]()
        
        for num in nums {
            if let value = map[num] {
                map[num] = value + 1
            } else {
                map[num] = 1
            }
        }
        
        //        print(map)
        
        if let result = map.filter{ $0.value >= 2 }.map{ $0.key }.first {
            return result
        }
        
        return 0
    }
    
    func increasingTriplet(_ nums: [Int]) -> Bool {
        
        //        Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.
        
        //        [1,2,3,4,5]
        //        [5,4,3,2,1]
        //        [2,1,5,0,4,6]
        //        [20,100,10,12,5,13]
        
        //        var stack = [Int]()
        var first = Int.max
        var second = Int.max
        var third = Int.max
        
        for num in nums {
            if first > num && second > num && third > num {
                first = num
                continue
            }
            if first < num && second > num && third > num {
                second = num
                continue
            }
            if first < num && second < num && third > num {
                third = num
                return true
            }
        }
        
        print("\(first) \(second) \(third)")
        
        return false
    }
    
    func countServers(_ grid: [[Int]]) -> Int {
        
        let m = grid.count
        let n = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var result = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    
                    // 가로
                    for row in 0..<n {
                        if grid[i][row] == 1 && !visited[i][row] && j != row {
                            visited[i][row] = true
                        }
                    }
                    
                    // 세로
                    for col in 0..<m {
                        if grid[col][j] == 1 && !visited[col][j] && i != col {
                            visited[col][j] = true
                        }
                    }
                    
                }
            }
        }
        
        print(visited)
        
        for i in 0..<m {
            for j in 0..<n {
                if visited[i][j] {
                    result += 1
                }
            }
        }
        
        return result
    }
    
    func setZeroes(_ matrix: inout [[Int]]) {
        //        Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.
        //
        //        Follow up:
        //
        //        A straight forward solution using O(mn) space is probably a bad idea.
        //        A simple improvement uses O(m + n) space, but still not the best solution.
        //        Could you devise a constant space solution?
        let m = matrix.count
        let n = matrix[0].count
        
        var stack = [(Int, Int)]()
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    stack.append((i,j))
                }
            }
        }
        
        while !stack.isEmpty {
            let data = stack.removeLast()
            let x = data.0
            let y = data.1
            
            for i in 0..<m {
                matrix[i][y] = 0
            }
            for j in 0..<n {
                matrix[x][j] = 0
            }
        }
        
        print(matrix)
    }
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        var array = Array(repeating: Array(repeating: 0, count: n), count: m)
        array[0][0] = grid[0][0]
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    array[i][j] = grid[i][j]
                } else {
                    if i == 0 {
                        array[i][j] = array[i][j-1] + grid[i][j]
                    } else if j == 0 {
                        array[i][j] = array[i-1][j] + grid[i][j]
                    } else {
                        array[i][j] = min(array[i-1][j], array[i][j-1]) + grid[i][j]
                    }
                }
            }
        }
        print(array[m-1][n-1])
        return array[m-1][n-1]
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var array = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    array[i][j] = 1
                } else {
                    array[i][j] = array[i-1][j] + array[i][j-1]
                }
            }
        }
        
        print(array)
        
        return array[m-1][n-1]
    }
    
    
    func fizzBuzz(_ n: Int) -> [String] {
        
        var array = Array(repeating: "", count: n)
        
        for i in 0..<n {
            let index = i+1
            
            if (index%3 == 0) && (index%5 == 0) {
                array[i] = "FizzBuzz"
            } else if (index%3==0) {
                array[i] = "Fizz"
            } else if (index%5==0) {
                array[i] = "Buzz"
            } else {
                array[i] = "\(index)"
            }
        }
        
        print(array)
        
        return []
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        guard let last = digits.last else { return [] }
        let size = digits.count
        var lastNumber = Int(last)
        lastNumber += 1
        
        if size > 1 {
            if lastNumber >= 10 {
                var parity = 1
                var index = size
                while index > 0 {
                    let num = digits[index-1] + parity
                    if num >= 10 {
                        parity = 1
                        digits[index-1] = 0
                    } else {
                        parity = 0
                        digits[index-1] = num
                        break
                    }
                    index -= 1
                }
                
                if parity == 1 {
                    digits.insert(parity, at: 0)
                }
            } else {
                digits.removeLast()
                digits.append(lastNumber)
            }
        } else {
            // size == 1
            if lastNumber >= 10 {
                digits.removeAll()
                digits.append(lastNumber/10)
                digits.append(lastNumber%10)
            } else {
                digits.removeLast()
                digits.append(lastNumber)
            }
        }
        
        print(digits)
        
        return digits
    }
    
    func isBoomerang(_ points: [[Int]]) -> Bool {
        
        let r1 = points[1][1] - points[0][1]
        let r2 = points[1][0] - points[0][0]
        let r3 = points[2][1] - points[0][1]
        let r4 = points[2][0] - points[0][0]
        
        return r2 * r3 != r1 * r4
    }
    
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        // Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
        
        //        Return the array in the form [x1,y1,x2,y2,...,xn,yn].
        
        var arr1 = Array(repeating: 0, count: n)
        var arr2 = Array(repeating: 0, count: n)
        var result = [Int]()
        
        for i in 0..<n {
            arr1[i] = nums[i]
        }
        for j in n..<2*n {
            arr2[j-n] = nums[j]
        }
        
        zip(arr1, arr2).forEach {
            result.append($0.0)
            result.append($0.1)
        }
        
        print(result)
        
        return result
    }
    
    func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
        
        let sum = arr.reduce(0, +)
        
        if sum % 3 != 0 { return false }
        
        var count = 0
        var total = 0
        
        for num in arr {
            total += num
            if total == sum / 3 {
                total = 0
                count += 1
            }
        }
        
        if count >= 3 {
            return true
        }
        
        return false
    }
    
    func numTeams(_ rating: [Int]) -> Int {
        
        var count = 0
        for i in 0..<rating.count - 2 {
            for j in i+1..<rating.count - 1 {
                for k in j+1..<rating.count {
                    if rating[i] > rating[j] && rating[j] > rating[k] { count += 1 }
                    if rating[i] < rating[j] && rating[j] < rating[k] { count += 1 }
                }
            }
        }
        return count
    }
    
    func countNicePairs(_ nums: [Int]) -> Int {
        
        var dict = [Int:Int]()
        let mod = 1000000007
        var dp = [String:Int]()
        var count = 0
        
        func rev(_ number: Int) -> Int {
            if let value = dp[String(number)] {
                return value
            }
            
            let res = Int(String(String(number).reversed()) ?? "0") ?? 0
            dp[String(number)] = res
            return res
        }
        
        for num in nums {
            dict[num - rev(num), default: 0] += 1
        }
        
        for (key, value) in dict {
            count += ((value-1)*value) / 2
            count %= mod
        }
        
        return count
    }
    
    
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return matrix.contains(where: { $0.contains(target)})
    }
    
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let morseArray = [".-","-...","-.-.","-..",".","..-.","--.","....","..",
                          ".---","-.-",".-..","--","-.","---",".--.","--.-",".-.",
                          "...","-","..-","...-",".--","-..-","-.--","--.."]
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        var map = [String:String]()
        
        for i in 0..<alphabet.count {
            map[String(describing: alphabet[i])] = morseArray[i]
        }
        //        print(alphabet)
        //        print(map)
        var set = Set<String>()
        
        for word in words {
            var morse = ""
            for char in word {
                morse += map[String(char)]!
            }
            set.insert(morse)
        }
        
        //        print(set)
        
        return set.count
    }
    
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = 0
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] && i < j {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func checkPossibility(_ nums: [Int]) -> Bool {
        var nums = nums
        var isDecresed = false
        
        for i in 0..<nums.count-1 {
            if nums[i] > nums[i+1] {
                if isDecresed {
                    return false
                }
                
                isDecresed = true
                
                if i >= 1 && nums[i-1] > nums[i+1] {
                    nums[i+1] = nums[i]
                }
            }
        }
        
        return true
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        
        nums.append(target)
        
        nums = nums.sorted()
        
        let index = nums.firstIndex(of:target)!
        
        print(index)
        
        return index
    }
    
    var width = 0
    var height = 0
    
    class TrieNode {
        var word: String?
        var children = [Character:TrieNode]()
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        
        width = board[0].count
        height = board.count
        
        var result = [String]()
        var board = board
        let root = makeTrie(with: words)
        
        for i in 0..<height {
            for j in 0..<width {
                find(&board, &result, i, j, root)
            }
        }
        
        return result
    }
    
    func makeTrie(with words: [String]) -> TrieNode {
        let root = TrieNode()
        
        for word in words {
            var node = root
            
            for char in word {
                if node.children[char] == nil{
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        
        return root
    }
    
    func find(_ board: inout [[Character]],_ result: inout [String],_ x: Int, _ y: Int, _ node: TrieNode) {
        guard x < height, y < width, x >= 0 , y >= 0 else { return }
        guard let currentNode = node.children[board[x][y]] else { return }
        
        if let word = currentNode.word {
            result.append(word)
            currentNode.word = nil
        }
        
        let char = board[x][y]
        board[x][y] = "0"
        
        find(&board, &result, x-1, y, currentNode)
        find(&board, &result, x+1, y, currentNode)
        find(&board, &result, x, y-1, currentNode)
        find(&board, &result, x, y+1, currentNode)
        
        board[x][y] = char
    }
    
    //
    //
    //    var dx = [0,1,0,-1]
    //    var dy = [1,0,-1,0]
    //
    //    var width = 0
    //    var height = 0
    //
    //    func exist(_ board: [[Character]], _ word: String) -> Bool {
    //        var words = Array(word)
    //        width = board[0].count
    //        height = board.count
    //
    //        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    //
    //        for i in 0..<height {
    //            for j in 0..<width {
    //                if board[i][j] == words[0] {
    //                    if dfs(board, &visited, i, j, words, 0) {
    //                        return true
    //                    }
    //                }
    //            }
    //        }
    //
    //        return false
    //    }
    //
    //    func dfs(_ board: [[Character]], _ visited: inout [[Bool]],_ x: Int, _ y: Int, _ current: [Character], _ index: Int) -> Bool {
    //        guard x < height, y < width, x >= 0, y >= 0 else { return false }
    //
    //        if visited[x][y] {
    //            return false
    //        }
    //
    //        if board[x][y] != current[index] {
    //            return false
    //        }
    //
    //        if index == current.count - 1 {
    //            return true
    //        }
    //
    //        visited[x][y] = true
    //
    //        if dfs(board, &visited, x+1, y, current, index+1) ||
    //            dfs(board, &visited, x-1, y, current, index+1) ||
    //            dfs(board, &visited, x, y+1, current, index+1) ||
    //            dfs(board, &visited, x, y-1, current, index+1) {
    //            return true
    //        }
    //
    //        visited[x][y] = false
    //
    //        return false
    //    }
    //
    func maximumSwap(_ num: Int) -> Int {
        
        var array = String(num).map{ String($0) }
        var result = Set<String>()
        
        for i in 0..<array.count {
            for j in i..<array.count {
                array.swapAt(i, j)
                result.insert(String(array.joined()))
                array.swapAt(i, j)
            }
        }
        
        //        print(result)
        
        if let maxNumber = result.max(),
           let strToInt = Int(maxNumber) {
            print(strToInt)
            return strToInt
        }
        
        return 0
    }
    
    func findNumbers(_ nums: [Int]) -> Int {
        
        let filtered = nums.map{ String($0) }.filter{ $0.count % 2 == 0 }
        //        print(filtered)
        return filtered.count
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var result = [Int]()
        // n2
        //        for i in 0..<numbers.count {
        //            for j in i+1..<numbers.count {
        //                if numbers[i] + numbers[j] == target {
        //                    result.append(i+1)
        //                    result.append(j+1)
        //                }
        //            }
        //        }
        var start = 0
        var end = numbers.count - 1
        
        while true {
            let sum = numbers[start] + numbers[end]
            
            if sum == target {
                result.append(start+1)
                result.append(end+1)
                break
            }
            
            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            }
        }
        
        print(result)
        return result
    }
    
    func arrayPairSum(_ nums: [Int]) -> Int {
        // [6,2,6,5,1,2]
        
        let sorted = nums.sorted(by: <)
        var pairs = [(Int, Int)]()
        var result = 0
        
        for i in stride(from: 0, through: sorted.count-1, by: 2) {
            let pair = (sorted[i], sorted[i+1])
            pairs.append(pair)
        }
        
        for pair in pairs {
            let minValue = min(pair.0, pair.1)
            result += minValue
        }
        
        print(result)
        
        return result
    }
    
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        // distance = 1,2,3,4 / start = 0 / destination = 0
        var dist1 = 0
        var dist2 = 0
        
        let stop1 = min(start, destination)
        let stop2 = max(start, destination)
        
        for i in stop1..<stop2 {
            dist1 += distance[i]
        }
        
        for i in 0..<stop1 {
            dist2 += distance[i]
        }
        
        for i in stop2..<distance.count {
            dist2 += distance[i]
        }
        
        return min(dist1, dist2)
    }
    
    //    func dfs(_ array: [[Int]],_ visited: inout [[Bool]],_ x: Int,_ size: Int,_ destination: Int,_ sum: Int) {
    //
    //        if x == destination {
    //            if minSum > sum {
    //                minSum = sum
    //            }
    //            return
    //        }
    //
    //        for i in 0..<size {
    //            if !visited[x][i] && array[x][i] > -1 {
    //                visited[x][i] = true
    //                visited[i][x] = true
    //                dfs(array, &visited, i, size, destination, sum + array[x][i])
    //            }
    //        }
    //    }
    
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        
        var array = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        for i in 0..<indices.count {
            let k = indices[i]
            
            for j in 0..<n {
                array[k[0]][j] += 1
            }
            for j in 0..<m {
                array[j][k[1]] += 1
            }
        }
        
        var count = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if array[i][j] % 2 != 0 {
                    count += 1
                }
            }
        }
        print(count)
        print(array)
        
        return count
    }
    
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        
        var A = A.sorted()
        let n = A.count
        
        if n == 1 {
            if A[0] > B[0] {
                return A
            } else {
                return [0]
            }
        }
        
        for i in 0..<n {
            let index = insert(B[i], A, i, n-1)
            if index == -1 { continue }
            let val = A.remove(at: index)
            A.insert(val, at: i)
        }
        print(A)
        
        
        //        var maxCount = 0
        //        permutation(A, 0)
        //
        //        for arr in permutations {
        //            var count = 0
        //            for i in 0..<B.count {
        //                if arr[i] > B[i] {
        //                    count += 1
        //                }
        //            }
        //            if maxCount < count {
        //                maxCount = count
        //                result.removeAll()
        //                result = arr
        //            }
        //        }
        //        print(result)
        return []
    }
    
    func insert(_ num: Int, _ arr: [Int],_ left: Int, _ right: Int) -> Int {
        if num > arr[right] {
            return -1
        }
        
        var left = left
        var right = right
        
        while left < right {
            let mid = (left + right) / 2
            if arr[mid] <= num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return arr[left] > num ? left : left + 1
    }
    
    func permutation(_ array: [Int], _ start: Int) {
        var array = array
        
        if start == array.count-1 {
            //            permutations.append(array)
            return
        }
        
        for i in start..<array.count {
            array.swapAt(start, i)
            permutation(array, start+1)
            array.swapAt(start, i)
        }
    }
    
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        
        let increse = arr.sorted(by: <)
        let decrese = arr.sorted(by: >)
        
        var gap = increse[1] - increse[0]
        
        for i in 1..<increse.count {
            if increse[i] - increse[i-1] != gap {
                return false
            }
        }
        
        gap = decrese[1] - decrese[0]
        
        for i in 1..<decrese.count {
            if decrese[i] - decrese[i-1] != gap {
                return false
            }
        }
        
        return true
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        
        let count = nums.filter{ $0 == 0 }.count
        if count != 0 {
            while nums.contains(0) {
                if let index = nums.firstIndex(of: 0) {
                    nums.remove(at: index)
                }
            }
            for i in 1...count {
                nums.append(0)
            }
        }
        
        
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if let firstIndex = nums.firstIndex(of: val) {
            nums.remove(at: firstIndex)
            removeElement(&nums, val)
        }
        return nums.count
    }
    
    func judgeCircle(_ moves: String) -> Bool {
        
        var start = (0,0)
        
        for direction in moves {
            let dir = String(direction)
            var x = start.0
            var y = start.1
            
            if dir == "L" {
                x += 0
                y -= -1
            } else if dir == "R" {
                x += 0
                y -= 1
            } else if dir == "U" {
                x += -1
                y -= 0
            } else {
                x += 1
                y -= 0
            }
            start = (x,y)
        }
        
        //        print(start)
        
        if start == (0,0) {
            return true
        }
        
        return false
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        
        var nums2 = nums2
        
        for num in nums1 {
            if nums2.contains(num) {
                result.append(num)
                nums2.remove(at: nums2.firstIndex(of: num)!)
            }
        }
        print(result)
        
        return result
    }
    
    func commonChars(_ A: [String]) -> [String] {
        // ["bella","label","roller"]
        
        var sorted = A.sorted().map{ $0.sorted() }
        
        let temp = sorted[0]
        var result = [String]()
        
        for t in temp {
            var isContain = false
            for i in 1..<sorted.count {
                let str = sorted[i]
                
                if str.contains(t) {
                    isContain = true
                    if let idx = str.firstIndex(of: t) {
                        sorted[i].remove(at: idx)
                    }
                } else {
                    isContain = false
                    break
                }
            }
            
            if isContain {
                result.append(String(t))
            }
        }
        
        //        print(result)
        return result
    }
    
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        
        let sorted1 = arr1.sorted()
        var arr2 = arr2
        
        print(sorted1)
        
        var temp = [sorted1[0]]
        
        for index in 1..<sorted1.count {
            
            let last = temp.last!
            
            if last == sorted1[index] {
                temp.append(sorted1[index])
            } else {
                if let firstIndex = arr2.firstIndex(of: last) {
                    temp.removeLast()
                    arr2.insert(contentsOf: temp, at: firstIndex)
                } else {
                    arr2.append(last)
                }
                
                temp.removeAll()
                temp.append(sorted1[index])
            }
        }
        
        let last = temp.last!
        if !temp.isEmpty {
            if let firstIndex = arr2.firstIndex(of: last) {
                temp.removeLast()
                arr2.insert(contentsOf: temp, at: firstIndex)
            } else {
                arr2.insert(contentsOf: temp, at: arr2.endIndex)
            }
        }
        //        print(temp)
        
        
        print(arr2)
        
        return []
    }
    
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        
        var length = 1
        var maxLength = Int.min
        
        for i in 1..<nums.count {
            var prev = nums[i-1]
            if nums[i] > prev {
                length += 1
            } else {
                maxLength = max(maxLength, length)
                length = 1
            }
        }
        
        //        print(maxLength)
        return max(maxLength, length)
    }
    
    func maxProduct(_ nums: [Int]) -> Int {
        // 2, 3, -2, 4
        
        var maxProducts = nums[0]
        var minProducts = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            
            //            maxProducts = max(nums[i], maxProducts*nums[i], minProducts*nums[i])
            //            minProducts = min(nums[i], maxProducts*nums[i], minProducts*nums[i])
            let a = maxProducts * nums[i]
            let b = minProducts * nums[i]
            maxProducts = max(nums[i], a, b)
            minProducts = min(nums[i], a, b)
            
            result = max(result, maxProducts)
        }
        
        
        return result
    }
    
    var maxValue = Int.min
    func maximumProduct(_ nums: [Int]) -> Int {
        
        let size = nums.count
        let sorted = nums.sorted(by: <)
        
        return max(sorted[0] * sorted[1] * sorted[size - 1], sorted[size-1] * sorted[size-2] * sorted[size-3])
    }
    
    
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        // print(nums.reduce(0, ^))
        //     10
        // xor 01
        //     11
        // 비트연산 (xor)하게 되면 같은 수는 0, 다른수는 1의 비트로 표현됨
        
        var dic = [Int:Int]()
        
        for num in nums {
            if let value = dic[num] {
                dic[num]  = value + 1
            } else {
                dic[num] = 1
            }
        }
        
        let result = dic.filter{ $0.value == 1 }.map{ $0.key }.first!
        
        return result
    }
    
    func missingNumber(_ nums: [Int]) -> Int {
        
        //        let size = nums.count
        //        let sorted = nums.sorted(by: <)
        //
        //        var contains = Array(repeating: false, count: size + 1)
        //
        //        for (index, _) in sorted.enumerated() {
        //            let value = sorted[index]
        //
        //            if !contains[value] {
        //                contains[value] = true
        //            }
        //        }
        //
        //        for (index, _) in contains.enumerated() {
        //            if !contains[index] {
        //                return index
        //            }
        //        }
        
        // 다른풀이
        
        let sorted = nums.sorted()
        
        for (index, num) in sorted.enumerated() where index != num {
            return index
        }
        
        return sorted.endIndex
    }
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
        guard !nums.isEmpty else { return [] }
        let sorted = nums.sorted(by: <)
        let size = sorted.count + 1
        var checked = Array(repeating: false, count: size)
        var result = [Int]()
        
        for i in 0..<sorted.count {
            let value = sorted[i]
            checked[value] = true
        }
        
        for i in 1..<checked.count {
            if !checked[i] {
                result.append(i)
            }
        }
        print(result)
        
        
        return result
    }
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        // [1,2,3,1] 3
        // [1,0,1,1] 1
        // [1,2,3,1,2,3] 2
        // [99, 99] 2
        
        // dic
        var dic = [Int:Int]()
        
        for i in 0..<nums.count {
            if let value = dic[nums[i]],  i - value <= k {
                return true
            } else {
                dic[nums[i]] = i
            }
        }
        
        
        // set
        //        var set = Set<Int>()
        //
        //        for i in 0..<nums.count {
        //            if i > k {
        //                set.remove(nums[i - k - 1])
        //            }
        //            if !set.insert(nums[i]).inserted {
        //                return true
        //            }
        //        }
        
        
        return false
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        var _nums = nums
        var set1 = Set<Int>()
        var sorted = [Int]()
        
        var answer = false
        
        for num in nums {
            set1.insert(num)
        }
        
        sorted = set1.sorted(by: <)
        _nums = nums.sorted(by: <)
        
        if !_nums.elementsEqual(sorted) {
            answer = true
        }
        
        return answer
    }
    
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // [1, 12, -5, -6, 50, 3] : 55
        // [-6, -5, 1, 3, 12, 50]
        // [1, 13, 8, 2 ,52 ,55]
        var max = Int.min
        var currentValue = 0
        for index in (0...nums.count-1){
            if index < k{
                currentValue += nums[index]
            } else {
                if currentValue > max{
                    max = currentValue
                }
                currentValue += nums[index] - nums[index - k]
            }
        }
        if currentValue > max{
            max = currentValue
        }
        return Double(max) / Double(k)
    }
}

