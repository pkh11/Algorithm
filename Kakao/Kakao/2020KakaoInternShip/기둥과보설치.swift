//
//  기둥과보설치.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/27.
//

import Foundation

class 기둥과보설치 {
    func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
        // default: 0, 기둥: 1, 보: 2
        var array = Array(repeating: Array(repeating: 0, count: n+3), count: n+3)
        
        for program in build_frame {
            let x = program[0] + 1
            let y = program[1] + 1
            let type = program[2]
            let doSomething = program[3]
            
            if doSomething == 0 {
                // 제거
                let temp = array[y][x]
                if type == 0 {
                    array[y][x] -= 1
                } else {
                    array[y][x] -= 2
                }
                
                if !removeStructure(array, n) {
                    array[y][x] = temp
                }
            } else {
                // 설치
                if type == 0 {
                    // 기둥
                    if isCorrectHorizontalBar(array, y, x) {
                        array[y][x] += 1
                    }
                } else {
                    // 보
                    if isCorrectVerticalBar(array, y, x) {
                        array[y][x] += 2
                    }
                }
            }
        }
        
        var result = [[Int]]()
        
        for i in 1...n+1 {
            for j in 1...n+1 {
                // 기둥
                if array[i][j] == 1 {
                    result.append([j-1, i-1, 0])
                } else if array[i][j] == 2  {
                    // 보
                    result.append([j-1, i-1, 1])
                } else if array[i][j] == 3 {
                    // 기둥&보
                    result.append([j-1, i-1, 0])
                    result.append([j-1, i-1, 1])
                }
            }
        }
        
        result = result.sorted(by: {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            } else if ($0[0] == $1[0]) && ($0[1] == $1[1]) {
                return $0[2] < $1[2]
            }
            return $0[0] < $1[0]
        })
        
        print(result)
        
        return result
    }
    
    // 기둥
    func isCorrectHorizontalBar(_ array: [[Int]],_ x: Int,_ y: Int) -> Bool {
        if x == 1 { return true }
        let isVerticalBar = array[x][y] == 2 || array[x][y] == 3
        let isOnVerticalBar = array[x][y-1] == 2 || array[x][y-1] == 3
        let isOnAnotherBar = array[x-1][y] == 1 || array[x-1][y] == 3
        return isVerticalBar || isOnVerticalBar || isOnAnotherBar
    }
    // 보
    func isCorrectVerticalBar(_ array: [[Int]], _ x: Int, _ y: Int) -> Bool {
        let isOnBar = (array[x-1][y] == 1 || array[x-1][y] == 3) || (array[x-1][y+1] == 1 || array[x-1][y+1] == 3)
        let isBetweenBar = (array[x][y-1] == 2 || array[x][y-1] == 3) && (array[x][y+1] == 2 || array[x][y+1] == 3)
        return isOnBar || isBetweenBar
    }
    // 제거
    func removeStructure(_ array: [[Int]],_ n: Int) -> Bool {
        for i in 1...n+1 {
            for j in 1...n+1 {
                if array[i][j] == 1 || array[i][j] == 3 {
                    if !isCorrectHorizontalBar(array, i, j) {
                        return false
                    }
                }
                if array[i][j] == 2 || array[i][j] == 3 {
                    if !isCorrectVerticalBar(array, i, j) {
                        return false
                    }
                }
            }
        }
        return true
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
