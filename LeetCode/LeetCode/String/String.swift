//
//  String.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class _String {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let sorted = strs.sorted(by: {$0.count < $1.count})
        guard !sorted.isEmpty else { return "" }

        var longestComPrefix = sorted[0]
        
        for index in 1..<sorted.count {
            let item = sorted[index]
            longestComPrefix = longestComPrefix.commonPrefix(with: item)
        }
        
        return longestComPrefix
    }
}
