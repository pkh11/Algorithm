//
//  _Array.swift
//  LeetCode
//
//  Created by 박균호 on 2021/02/05.
//

import Foundation

class _Array {
    
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