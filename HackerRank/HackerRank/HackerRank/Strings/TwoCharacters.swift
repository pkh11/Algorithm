//
//  TwoCharacters.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/24.
//

import Foundation

class TwoCharacters {
    
    var combinations = [[Character]]()
    func alternate(s: String) -> Int {

        var set = Set<Character>()
        var result = [String]()
        
        for char in s {
            set.insert(char)
        }
        
        let array = Array(set)
        
        combination(0, array, 2, [])
        
        for combi in combinations {
            let twoCharacters = combi
            let filtered = Array(s.filter{ twoCharacters.contains($0) })
            
            var isContinuous = false
            for i in 1..<filtered.count {
                if filtered[i] == filtered[i-1] {
                    isContinuous = true
                    break
                }
            }
            
            if !isContinuous {
                let makeStr = filtered.map{ String($0) }.joined()
                result.append(makeStr)
            }
        }
        
        if let longestString = result.map({ $0.count }).max() {
            return longestString
        }
        
        return 0
    }
    
    func combination(_ index: Int, _ array: [Character], _ shouldSelect: Int, _ selected: [Character]) {
        if shouldSelect == 0 {
            combinations.append(selected)
        } else if index == array.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(array[index])
            
            combination(index + 1, array, shouldSelect, selected)
            combination(index + 1, array, shouldSelect - 1, newSelected)
        }
    }
}
