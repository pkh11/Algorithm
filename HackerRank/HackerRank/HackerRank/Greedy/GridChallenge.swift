//
//  GridChallenge.swift
//  HackerRank
//
//  Created by 박균호 on 2021/01/04.
//

import Foundation

class GridChallenge {
    // Complete the gridChallenge function below.
    func gridChallenge(grid: [String]) -> String {
        // ["eabcd", "fghij", "olkmn", "trpqs", "xywuv"]
        
        var array = Array(grid)
        var matrix = Array(repeating: Array(repeating: "", count: grid.count), count: grid.count)
        var sortedCol = [String]()
        
        var sortedRow = [String]()
        
        for i in 0..<matrix.count {
            let cols = Array(array[i]).map{ String($0) }
            for j in 0..<cols.count {
                matrix[i][j] = cols[j]
            }
        }
        
        for i in 0..<matrix.count {
            var col = [String]()
            for j in 0..<matrix.count {
                col.append(matrix[j][i])
            }
            sortedCol.append(col.sorted(by: <).map{ String($0) }.joined())
        }
        
        print(sortedCol)
        
        for row in grid {
            sortedRow.append(row.sorted(by: <).map{ String($0) }.joined())
        }
        
        
        return ""
    }
}
