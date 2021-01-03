//
//  크레인인형뽑기게임.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 크레인인형뽑기게임 {
    func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
        
        let size = board.count
        var boards = board
        var results = [Int]()
        var duplicate = 0

        for position in moves {
            let pos = position - 1

            for i in 0..<size {
                if boards[i][pos] != 0 {
                    
                    let doll = boards[i][pos]
                    let lastNumber = results.last
                    
                    guard doll != 0 else { continue }
                    
                    boards[i][pos] = 0
                    
                    if doll == lastNumber {
                        // 있으면 board[i][pos] = 0 & result[i] = 0
                        results.removeLast()
                        duplicate += 2
                    } else {
                        // 없으면 board[i][pos] = 0 & result.append(value)
                        results.append(doll)
                    }
                    break
                }
                
            }
        }
        print(duplicate)
        return duplicate
    }
}
