//
//  소수만들기.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 소수만들기 {
    var selectedNums: [[Int]] = [[]]
    
    func solution(_ nums:[Int]) -> Int {
        var answer = 0
        // 서로 다른 3개 뽑기
        makeCombination(0, 3, nums, [])
        
        let filtered = selectedNums.filter{ !$0.isEmpty }.map{ $0.reduce(0){$0 + $1} }
        for num in filtered {
            if isPrimeNumber(with: num) {
                answer += 1
            }
        }
        print(answer)
        return answer
    }
    
    func isPrimeNumber(with num: Int) -> Bool {
        var count = 0
        for index in 1...num {
            if num % index == 0 {
                count += 1
            }
        }

        return count == 2 ? true : false
    }
    
    // nCr = n-1Cr-1 + n-1Cr
    // shouldSelect: r (뽑을 갯수)
    // 1,2,7,6,4
    func makeCombination(_ index: Int,_ shouldSelect: Int,_ array: [Int],_ selected: [Int]) {
        print("///// \(index)")
        print(selected)
        if shouldSelect == 0 {
            selectedNums.append(selected)
        } else if index == array.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(array[index])
            makeCombination(index+1, shouldSelect - 1, array, newSelected)
            makeCombination(index+1, shouldSelect, array, selected)
        }
    }
}
