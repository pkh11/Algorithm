//
//  Simulation.swift
//  LeetCode
//
//  Created by 박균호 on 2021/08/09.
//

import Foundation

class Simulation {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        
        var indexed = [Int]()
        var result = [Int]()
        
        for (index, char) in s.enumerated() {
            if char == c {
                indexed.append(index)
            }
        }
        
        for (index, _) in s.enumerated() {
            var minValue = s.count
            
            for num in indexed {
                if index != num {
                    minValue = min(minValue, abs(index - num))
                } else {
                    minValue = 0
                }
            }
            
            result.append(minValue)
        }
        
        print(result)
        
        return result
    }
    
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        // reverse
        var image = image
        for (index, img) in image.enumerated() {
            let reversed = img.reversed()
            image[index] = Array(reversed)
        }
        
        // invert
        for (index, img) in image.enumerated() {
            var data = img
            for (j, value) in data.enumerated() {
                if value == 0 {
                    data[j] = 1
                } else {
                    data[j] = 0
                }
            }
            image[index] = data
        }
        
        print(image)
        return image
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        let len1 = num1.count
        let len2 = num2.count
        
        let num1 = num1.reversed().map{ String($0) }.map{ Int($0)! }
        let num2 = num2.reversed().map{ String($0) }.map{ Int($0)! }
        var result = Array(repeating: 0, count: len1 + len2)

        for i in 0..<len1 {
            for j in 0..<len2 {
                result[i+j] += num1[i] * num2[j]
            }
        }
        
        for i in 0..<result.count-1 {
            result[i+1] += result[i] / 10
            result[i] %= 10
        }
        
        while result.last == 0 {
            result.removeLast()
        }

        return result.reversed().map{ String($0) }.reduce("", +)
    }
}
