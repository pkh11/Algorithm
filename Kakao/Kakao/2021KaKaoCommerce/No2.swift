//
//  No2.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/03.
//

import Foundation

class No2 {
    var robotCombi = [String]()
    
    func solution(_ needs:[[Int]], _ r:Int) -> Int {
        
        // 부품 처리할 로봇 조합 구하기
        let col = needs[0].count
        let row = needs.count
        var parts = [Int:String]()
        var partsSample = [String]()
        var result = [Int]()
        
        for i in 0..<col {
            partsSample.append(String(i))
        }
        
        makeCombination(0, partsSample, r, [])
        
        // 부품 정보
        for i in 0..<row {
            for j in 0..<col {
                if needs[i][j] == 1 {
                    if let value = parts[i] {
                        parts[i] = value + "\(j)"
                    } else {
                        parts[i] = "\(j)"
                    }
                }
            }
        }
        
        // 로봇 조합 순서대로 가능한 완제품 번호 구하기
        
        for i in 0..<robotCombi.count {
            let combi = robotCombi[i]
            var count = 0
            
            for j in 0..<parts.count-1 {
                let part = parts[j]!
                
                if combi.contains(part) {
                    count += 1
                }
            }
            
            result.append(count)
        }
        
        print(result)
        
//        print(parts)
        return result.max()!
    }
    
    func makeCombination(_ index: Int, _ array: [String], _ shouldSelect: Int,_ selected: [String]) {
        if shouldSelect == 0 {
            robotCombi.append(selected.joined())
        } else if index == array.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(array[index])
            
            makeCombination(index+1, array, shouldSelect - 1, newSelected)
            makeCombination(index+1, array, shouldSelect, selected)
        }
    }
}
