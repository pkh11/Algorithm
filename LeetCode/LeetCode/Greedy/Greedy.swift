//
//  392.swift
//  LeedCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class Greedy {
    
    func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ numWanted: Int, _ useLimit: Int) -> Int {
                
        return 0
    }
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
//        Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.
//
//        However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.
//
//        Return the least number of units of times that the CPU will take to finish all the given tasks.

        var map = [Character:Int]()
        
        for task in tasks {
            if let values = map[task] {
                map[task] = values + 1
            } else {
                map[task] = 1
            }
        }

        let taskFrequency = map.sorted { $0.value > $1.value }
        let maxFrequency = taskFrequency[0].1
        var idleTime = (maxFrequency - 1) * n
        
        for i in 1..<taskFrequency.count {
            idleTime -= min(maxFrequency - 1, taskFrequency[i].1)
        }
        
        idleTime = max(0, idleTime)
        
        return tasks.count + idleTime
    }
    
    func maxSumDivThree(_ nums: [Int]) -> Int {
        
        var oneRemainder = 20000
        var twoRemainder = 20000
        var sum = 0
        
        for num in nums {
            sum += num
            
            if num % 3 == 1 {
                twoRemainder = min(twoRemainder, oneRemainder + num)
                oneRemainder = min(oneRemainder, num)
            }
            
            if num % 3 == 2 {
                oneRemainder = min(oneRemainder, twoRemainder + num)
                twoRemainder = min(twoRemainder, num)
            }
        }
        
        if sum % 3 == 0 {
            return sum
        }
        if sum % 3 == 1 {
            return sum - oneRemainder
        }
        if sum % 3 == 2 {
            return sum - twoRemainder
        }
        
        return 0
    }
    
    func minOperations(_ nums: [Int]) -> Int {
            
        var nums = nums
        guard nums.count != 1 else { return 0 }
        var answer = 0
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] > nums[j] {
                    let gap = nums[i] - nums[j] + 1
                    answer = answer + gap
                    nums[j] += gap
                } else if nums[i] == nums[j] {
                    answer = answer + 1
                    nums[j] += 1
                }
            }
        }
        print(answer)
        
        return answer
    }
    
    func maximum69Number (_ num: Int) -> Int {
        var maxValue = num
        let num = String(num).map{ String($0) }
        var copy = num
        
        for i in 0..<num.count {
            if num[i] == "6" {
                copy[i] = "9"
            } else {
                copy[i] = "6"
            }
            
            let joined = Int(copy.joined())!
            maxValue = max(maxValue, joined)
            
            copy[i] = num[i]
        }
        
        print(maxValue)
        
        return 0
    }

    
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
            
        var answer = false
        var n = n
        var flowerbed = flowerbed
        
        for i in 0..<flowerbed.count {
            if flowerbed[i] == 0 && (i == 0 || flowerbed[i-1] == 0) && (i == flowerbed.count-1 || flowerbed[i+1] == 0){
                flowerbed[i] = 1
                n -= 1
            }
            
            if n <= 0 {
                answer = true
            }
        }
        
        return answer
    }
    
    func diStringMatch(_ s: String) -> [Int] {
               
        var result = [Int](repeating: 0, count: s.count+1)
        let str = s.map{ String($0) }
        let size = str.count
        
        var ivalue = 0
        var dvalue = size
        
        for i in 0..<size {
            if str[i] == "I" {
                result[i] = ivalue
                ivalue += 1
            } else {
                result[i] = dvalue
                dvalue -= 1
            }
        }
        
        if str[size-1] == "I" {
            result[size] = result[size-1] + 1
        } else {
            result[size] = result[size-1] - 1
        }
        
        print(result)
        
        return result
    }
    
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        
//        You are given an integer array nums sorted in non-decreasing order.
//
//        Build and return an integer array result with the same length as nums such that result[i] is equal to the summation of absolute differences between nums[i] and all the other elements in the array.
//
//        In other words, result[i] is equal to sum(|nums[i]-nums[j]|) where 0 <= j < nums.length and j != i (0-indexed).
        let n = nums.count
        var result = Array(repeating: 0, count: n)
        let sum = nums.reduce(0, +)
        var currSum = 0
        
        for i in 0..<nums.count {
            result[i] = (i * nums[i] - currSum) + (sum - currSum - (n-i) * nums[i])
            currSum += nums[i]
        }
        
        print(result)
        return result
    }
    
    func minPairSum(_ nums: [Int]) -> Int {
        
        let nums = nums.sorted(by: >)
        var start = 0
        var end = nums.count-1
        var value = 0
        
        while start < end {
            value = max(value, nums[start] + nums[end])
            start += 1
            end -= 1
        }
        
        print(value)
        
        return 0
    }
    
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
//        You are given two non-increasing 0-indexed integer arrays nums1​​​​​​ and nums2​​​​​​.
//        A pair of indices (i, j), where 0 <= i < nums1.length and 0 <= j < nums2.length, is valid if both i <= j and nums1[i] <= nums2[j]. The distance of the pair is j - i​​​​.
//        Return the maximum distance of any valid pair (i, j). If there are no valid pairs, return 0.
//        An array arr is non-increasing if arr[i-1] >= arr[i] for every 1 <= i < arr.length.
        
        var distance = 0
        
//        for i in 0..<nums1.count {
//            if nums1[i] <= nums2[i] {
//                for j in i+1..<nums2.count {
//                    if nums1[i] <= nums2[j] {
//                        distance = max(distance, j-i)
//                    }
//                }
//            }
//        }
        // 런타임 에러를 해결 하는 방법
        for i in 0..<nums1.count {
            var start = 0
            var end = nums2.count-1
            
            while start < end {
                var mid = (start+end+1) / 2
                if nums1[i] <= nums2[mid] {
                    start = mid
                } else {
                    end = mid-1
                }
            }
            
            if nums1[i] <= nums2[start] {
                distance = max(distance, start-i)
            }
        }
        
        
        print(distance)
        
        return distance
    }
    
    func lemonadeChange(_ bills: [Int]) -> Bool {
        
        // lemonade 5
        // 5, 10, 20
        
        // input: 5,5,5,10,20
        // [5,5,5,5,20,20,5,5,20,5]
        // [5,5,5,10,5,5,10,20,20,20]
        // 5,5,10,10,20
        
        var five = 0
        var ten = 0
        
        for bill in bills {
            
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                five -= 1
                ten += 1
            } else if bill == 20 && ten > 0 {
                ten -= 1
                five -= 1
            } else {
                five -= 3
            }
            
            if five < 0 {
                return false
            }
        }
        
        
        return true
    }
    
    func minSubsequence(_ nums: [Int]) -> [Int] {
        
        let sorted = nums.sorted(by: >)
        let total = sorted.reduce(0) { $0 + $1 }
        var result = [Int]()
        
        var sum = 0
        for num in sorted {
            sum += num
            result.append(num)
            
            let remain = total - sum
            if sum > remain {
                //                print(result)
                return result
            }
        }
        
        return []
    }
    
    func lastStoneWeight(_ stones: [Int]) -> Int {
        // [2,7,4,1,8,1]
        
        var _stones = stones
        
        while true {
            _stones = _stones.sorted(by: <)
            
            if _stones.count <= 1 {
                break
            }
            
            if let max1 = _stones.popLast(),
               let max2 = _stones.popLast() {
                if max1 > max2 {
                    let remain = max1 - max2
                    _stones.append(remain)
                }
            }
        }
        
        return _stones.isEmpty ? 0 : _stones[0]
    }
    
    func balancedStringSplit(_ s: String) -> Int {
        
        var array = [Int]()
        
        for char in s {
            if char == "R" {
                array.append(1)
            } else {
                array.append(-1)
            }
        }
        
        var sum = 0
        var count = 0
        for (_, value) in array.enumerated() {
            sum += value
            if sum == 0 {
                count += 1
            }
        }
        print(count)
        
        
        return count
    }
    
    var count = 0
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        
        return max(maxDepth(root.left!), maxDepth(root.right!)) + 1
    }
    
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        //1,3 2,2 3,1 / 4
        // unit이 제일 많은 순으로 정렬
        let sorted = boxTypes.sorted(by: { $0[1] > $1[1] })
        var units = 0
        var boxes = 0
        
        for boxType in sorted {
            let numberOfBoxes = boxType[0]
            let unitsPerBox = boxType[1]
            
            boxes += numberOfBoxes
            
            if boxes > truckSize {
                let remain = boxes - truckSize
                units += (numberOfBoxes - remain) * unitsPerBox
                break
            } else {
                units += numberOfBoxes * unitsPerBox
            }
        }
        
        print(units)
        
        return units
    }
    
    func totalMoney(_ n: Int) -> Int {
        
        let week = n/7
        let days = n%7
        
        let moneyOfWeek = [1, 2, 3, 4, 5, 6, 7]
        var money = 0
        
        if week == 0 {
            for i in 0..<days {
                money += moneyOfWeek[i]
            }
        } else {
            for w in 0..<week {
                money += 28 + w*7
            }
            for day in 0..<days {
                money += (moneyOfWeek[day] + week)
            }
        }
        
        print(money)
        
        return money
    }
    
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        
        let sortedG = g.sorted(by: <)
        let sortedS = s.sorted(by: <)
        var i = 0
        var j = 0
        
        while i<sortedG.count && j<sortedS.count {
            if sortedG[i] <= sortedS[j] {
                i+=1
            }
            j+=1
        }
        
        print(i)
        
        return 0
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
            }
        }
        
        print(profit)
        return 0
    }
    
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        // s = abc
        // t = ahbgdc
        
        let array1 = Array(s).map{ String($0) }
        let array2 = Array(t).map{ String($0) }
        var result = false
        
        var str = ""
        var index = 0
        for i in 0..<array1.count {
            for j in index..<array2.count {
                if array1[i] == array2[j] {
                    str += array2[j]
                    index = j + 1
                    break
                }
            }
        }
        
        if s.elementsEqual(str) {
            result = true
        }
        
        return result
    }
}
