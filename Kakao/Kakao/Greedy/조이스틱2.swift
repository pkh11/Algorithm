//
//  조이스틱2.swift
//  Kakao
//
//  Created by 박균호 on 2021/07/13.
//

import Foundation


class 조이스틱2 {
    let alphabets = ["A":1, "B":2, "C":3, "D":4, "E":5, "F":6, "G":7, // 6
                     "H":8, "I":9, "J":10, "K":11, "L":12, "M":13, "N":14, // 13
                     "O":15, "P":16, "Q":17, "R":18, "S":19, "T":20, "U":21, // 20
                     "V":22, "W":23, "X":24, "Y":25, "Z":26]

    func solution(_ name:String) -> Int {
        
        var ans = 0
        let name = name.map{ ($0) }
        
        for i in 0..<name.count {
            if name[i] != "A" {
                let up = name[i].asciiValue! - 65
                let down = 91 - name[i].asciiValue!
                ans += Int((up<down) ? up : down)
            }
        }
        
        var minMove = name.count-1
        for i in 0..<name.count {
            if name[i] != "A" {
                var next = i + 1
                while next<name.count && name[next] == "A" {
                    next += 1
                }
                let move = 2 *  i + name.count - next
                minMove = min(move, minMove)
            }
        }
        
        return ans + minMove
    }

    
}


