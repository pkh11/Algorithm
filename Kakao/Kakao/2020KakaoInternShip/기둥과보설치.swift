//
//  기둥과보설치.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/27.
//

import Foundation

class 기둥과보설치 {
    func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
        // [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]
        var array = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
        
        for program in build_frame {
            let x = program[0]
            let y = program[1]
            let type = program[2]
            let doSomething = program[3]
            
            if doSomething == 0 {
                // 제거
                let temp = array[y][x]
                array[y][x] = -1
                if !isCorrectPosition(array, type, doSomething, x, y) {
                    array[y][x] = temp
                }
            } else {
                // 설치
                if type == 0 {
                    array[y][x] = 0
                    
                } else {
                    array[y][x] = 1
                }
                if !isCorrectPosition(array, type, doSomething, x, y) {
                    array[y][x] = -1
                }
                
            }
        }
        
        var result = [[Int]]()
        
        for i in 0..<array.count {
            for j in 0..<array[i].count {
                if array[i][j] == 0 || array[i][j] == 1 {
                    result.append([j, i, array[i][j]])
                }
            }
        }
        print(array)
        
        result = result.sorted(by: {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            } else if $0[0] == $1[0] && $0[1] == $1[1] {
                return $0[2] < $1[2]
            }
            return $0[0] < $1[0]
        })
        
//        print(result)
        return result
    }
    
    func isCorrectPosition(_ array: [[Int]], _ type: Int, _ do: Int,_ x: Int,_ y: Int) -> Bool {
        // 기둥
        if type == 0 {
            // 바닥위에 있어야 함
            if y == 0 {
                return true
            } else {
                // 보 한쪽 끝 부분 위에 있어야 함
                if array[y][x-1] == 1 || array[y+1][x] == 1 {
                    return true
                } else {
                    if array[y-1][x] == 0 {
                        // 기둥 위에 있어야 함
                        return true
                    } else {
                        return false
                    }
                }
            }
        } else {
            // 보
            // 보의 한쪽 끝에 기둥이 위치해야 함
            if array[y-1][x] == 0 || array[y-1][x+1] == 0 {
                return true
            } else {
                if  array[y][x] == 1 && array[y][x-1] == 1 && array[y][x+1] == 1 {
                    // 보의 양쪽에 보가 위치해야 함
                     return true
                } else {
                    return false
                }
            }
        }
    }
}
