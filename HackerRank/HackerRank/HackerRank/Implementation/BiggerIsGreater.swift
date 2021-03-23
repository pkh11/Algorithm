//
//  BiggerIsGreater.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/22.
//

import Foundation

class BiggerIsGreater {
    
    func biggerIsGreater(w: String) -> String {
        // 1. for문 돌면서 뒤에서부터 감소하는 부분 찾기
        // 2. (감소하는 부분의 인덱스 ~ 끝)를 제외하고 가장 작은 값 찾기
        // 3. 감소하는 부분과 swap
        // 4. 감소하는 인덱스부터 sorting
        
        var chars: [Character] = Array(w)
        let length = chars.count
        var greater = chars[length - 1]
        var endIndex = 0
        
        // 1.
        for i in stride(from: length - 1, through: 1, by: -1) {
            if chars[i] > chars[i - 1] {
                endIndex = i
                break
            }
        }
        
        if endIndex == 0 {
            return "no answer"
        } else {
            // 2.
            let firstSmallChar = chars[endIndex - 1]
            var nextSmallChar = endIndex
            
            for i in (endIndex + 1)..<length {
                if chars[i] > firstSmallChar && chars[i] < chars[nextSmallChar] {
                    nextSmallChar = i
                }
            }
            // 3.
            chars.swapAt(endIndex - 1, nextSmallChar)
            
            // 4.
            var leftArray = chars[0..<endIndex]
            let rightArray = chars[endIndex..<length].sorted()
            
            for i in 0..<rightArray.count {
                leftArray.append(rightArray[i])
            }
            
            return leftArray.map{ String($0) }.joined()
        }
        
//        let size = array.count - 1
//        var min = Int.max
//        var minIndex = Int.max
//
//        for i in stride(from: size, through: 1, by: -1) {
//            // 1.
//            if array[i] > array[i-1] {
//                let turningPoint = i-1
//                // 2.
//                for j in i...size {
//                    if array[turningPoint] < array[j] && min > array[j] {
//                        min = array[j]
//                        minIndex = j
//                    }
//                }
//
//                // 3.
//                array.swapAt(turningPoint, minIndex)
//                print(array)
//                // 4.
//                var splited = array[0...turningPoint]
//                let sorted = array[turningPoint+1...size].sorted()
//
//                print(splited)
//                print(sorted)
//
//                for index in 0..<sorted.count {
//                    splited.append(sorted[index])
//                }
//
//                result = splited.map{ String($0) }.joined()
//                break
//            }
//        }
//
//        print(result)
//
//        if w.elementsEqual(result) {
//            return "no answer"
//        }
//
//        return result
    }

    /*
    func makeCombination(_ array: [String], _ index: Int, _ selected: [String], _ shouldSelect: Int) {
        print(selected)
        if shouldSelect == 0 {
    
        } else if index == array.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(array[index])
            makeCombination(array, index+1, newSelected, shouldSelect-1)
            makeCombination(array, index+1, selected, shouldSelect)
        }
    }
    
    func permutaion(_ array: [String], _ shouldSelect: Int) {
        if shouldSelect == 0 {
            permutations.append(array.joined())
        } else {
            var newArray = array
            permutaion(newArray, shouldSelect-1)
            for i in 0..<shouldSelect {
                newArray.swapAt(i, shouldSelect)
                permutaion(newArray, shouldSelect-1)
                newArray.swapAt(i, shouldSelect)
            }
        }
    }
 */
}
