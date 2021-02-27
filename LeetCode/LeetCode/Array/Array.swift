//
//  _Array.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/05.
//

import Foundation

class _Array {
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

