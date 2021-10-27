//
//  5주차_모음사전.swift
//  Kakao
//
//  Created by 박균호 on 2021/10/27.
//

import Foundation

class Week5 {
    
    var dic = [String]()
    
    func solution(_ word: String) -> Int {
        // 사전에 알파벳 모음 'A', 'E', 'I', 'O', 'U'만을 사용하여 만들 수 있는, 길이 5 이하의 모든 단어가 수록되어 있습니다. 사전에서 첫 번째 단어는 "A"이고, 그다음은 "AA"이며, 마지막 단어는 "UUUUU"입니다.
        
        let alphabets = ["A", "E", "I", "O", "U"]
        
        for i in 1...5 {
            var selected = [String](repeating: "", count: i)
            makePermutationWithRepetition(alphabets, &selected, i, 0)
        }

        dic = dic.sorted()

        var result = 0
        if let firstIndex = dic.firstIndex(of: word) {
            result = firstIndex + 1
        }
        
        return result
    }
    
    func makePermutationWithRepetition(_ array: [String], _ selected: inout [String], _ shouldSelected: Int, _ depth: Int) {
        if depth == shouldSelected {
            dic.append(selected.joined())
            return
        }
        
        for i in 0..<array.count {
            selected[depth] = array[i]
            makePermutationWithRepetition(array, &selected, shouldSelected, depth+1)
        }
    }
}
