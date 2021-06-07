//
//  392.swift
//  LeedCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class Greedy {
    
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
