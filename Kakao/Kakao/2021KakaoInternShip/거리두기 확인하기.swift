//
//  거리두기 확인하기.swift
//  Kakao
//
//  Created by 박균호 on 2021/07/21.
//

import Foundation

class 거리두기확인하기 {
    
    let dx = [1, 2, 0, 0, 1, -1]
    let dy = [0, 0, 1, 2, 1, 1]
    
    func solution(_ places:[[String]]) -> [Int] {

        var result = Array(repeating: 1, count: 5)
        
        for (index, place) in places.enumerated() {
            var array = Array(repeating: Array(repeating: "", count: 5), count: 5)
            
            for i in 0..<place.count {
                let row = Array(place[i])
                
                for j in 0..<row.count {
                    array[i][j] = String(row[j])
                }
            }
                
            for i in 0..<5 {
                for j in 0..<5 {
                    if array[i][j] == "P" {
                        if !find(i, j, array) {
                            result[index] = 0
                        }
                    }
                }
            }
        }
        
        print(result)
        
        return result
    }
    
    func find(_ x: Int, _ y: Int, _ array: [[String]]) -> Bool {
        
        for dir in 0..<6 {
            let nx = x + dx[dir]
            let ny = y + dy[dir]

            if nx >= 0 && nx < 5 && ny >= 0 && ny < 5 {
                if array[nx][ny] == "P" {
                    if x == nx {
                        if array[x][y+1] != "X" {
                            return false
                        }
                    } else if y == ny {
                        if array[x+1][y] != "X" {
                            return false
                        }
                    } else  {
                        if x > nx {
                            if array[x-1][y] != "X" || array[x][y+1] != "X" {
                                return false
                            }
                        } else {
                            if array[x+1][y] != "X" || array[x][y+1] != "X" {
                                return false
                            }
                        }
                    }
                }
            }
        }
        return true
    }
}

