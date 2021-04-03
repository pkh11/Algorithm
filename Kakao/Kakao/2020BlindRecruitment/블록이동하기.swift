//
//  블록이동하기.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/24.
//

import Foundation

class 블록이동하기 {
    
    // 오른, 아래, 왼, 위
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
//    let dx = [0,0,1,-1]
//    let dy = [1,-1,0,0]
    
    // 오른쪽위, 오른쪽아래, 왼쪽아래, 왼쪽위
    let rdx = [-1, 1, 1, -1]
    let rdy = [1, 1, -1, -1]
    
    var _board = [[Int]]()
    
    // state = 0:가로, 1:세로
    
    func solution(_ board:[[Int]]) -> Int {
        
        _board = board
        let N = board.count
        var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: N), count: N)
        let robot = Robot(x: 0, y: 0, direction: 0, time: 0) // start position
        
        print(move([robot], &visited, N))
        
        return 0
    }
    func move(_ array: [Robot], _ visited: inout [[[Bool]]], _ size: Int) -> Int {
        var array = array
        
        while !array.isEmpty {
            let robot = array.removeFirst()
            let x1 = robot.x
            let y1 = robot.y
            var dir = robot.direction
            let time = robot.time
            let x2 = x1 + dx[dir]
            let y2 = y1 + dy[dir]
            
            if isFinish(x1, y1, size) || isFinish(x2, y2, size) {
                return time
            }
            var nx1 = 0
            var ny1 = 0
            var nx2 = 0
            var ny2 = 0
            // 이동
            for i in 0...3 {
                nx1 = x1 + dx[i]
                ny1 = y1 + dy[i]
                nx2 = x2 + dx[i]
                ny2 = y2 + dy[i]
                
                if (!isValidRange(nx1, ny1, size) || !isValidRange(nx2, ny2, size)) { continue }
                if (isWall(nx1, ny1, _board) || isWall(nx2, ny2, _board)) { continue }
                if visited[nx1][ny1][dir] { continue }
                
                visited[nx1][ny1][dir] = true
                array.append(Robot(x: nx1, y: ny1, direction: dir, time: time+1))
            }
            // i == 1 : 시계방향
            // i == 3 : 반시계방향
            for i in stride(from: 1, through: 4, by: 2) {
                let nextDir = (dir+i) % 4
                nx2 = x1 + dx[nextDir]
                ny2 = y1 + dy[nextDir]
                
                var rotateX = 0
                var rotateY = 0
                
                if (i == 1) {
                    // 시계 방향
                    rotateX = x1 + rdx[nextDir]
                    rotateY = y1 + rdy[nextDir]
                } else {
                    // 반시계 방향
                    rotateX = x1 + rdx[dir]
                    rotateY = y1 + rdy[dir]
                }
                
                if (!isValidRange(rotateX, rotateY, size) || !isValidRange(nx2, ny2, size)) { continue }
                if (isWall(rotateX, rotateY, _board) || isWall(nx2, ny2, _board)) { continue }
                if visited[x1][y1][nextDir] { continue }
                
                visited[x1][y1][nextDir] = true
                array.append(Robot(x: x1, y: y1, direction: nextDir, time: time+1))
            }
            
            // 반대방향
            dir = (dir+2) % 4
            
            // i == 1 : 시계방향
            // i == 3 : 반시계방향
            for i in stride(from: 1, through: 4, by: 2) {
                var nextDir = (dir+i) % 4
                nx1 = x2 + dx[nextDir]
                ny1 = y2 + dy[nextDir]
                
                var rotateX = 0
                var rotateY = 0
                
                if (i == 1) {
                    // 시계 방향
                    rotateX = x2 + rdx[nextDir]
                    rotateY = y2 + rdy[nextDir]
                } else {
                    // 반시계 방향
                    rotateX = x2 + rdx[dir]
                    rotateY = y2 + rdy[dir]
                }
                
                nextDir = (nextDir+2) % 4
                
                if (!isValidRange(rotateX, rotateY, size) || !isValidRange(nx1, ny1, size)) { continue }
                if (isWall(rotateX, rotateY, _board) || isWall(nx1, ny1, _board)) { continue }
                if visited[nx1][ny1][nextDir] { continue }
                
                visited[nx1][ny1][nextDir] = true
                array.append(Robot(x: nx1, y: ny1, direction: nextDir, time: time+1))
            }
        }
        
        return -1
    }
    /*
    func move(_ array: [Robot], _ visited: inout [[[Bool]]], _ size: Int) -> Int {
        
        var array = array
        
        while !array.isEmpty {
            let robot = array.popLast()!
            let x = robot.x
            let y = robot.y
            let dir = robot.direction
            let time = robot.time
            
            
            if isFinish(x, y, size) {
                return time
            }
            
            for dir in 0...3 {
                let nx = x + dx[dir]
                let ny = y + dy[dir]
                
                if nx < 0 || nx >= size || ny < 0 || ny >= size || visited[nx][ny][dir] || board[nx][ny] == 1 {
                    continue
                }
                if (dir == 0 && ny-1 < 0) || (dir == 1 && nx-1 < 0) {
                    continue
                }
                if (dir == 0 && board[nx][ny-1] == 1) || (dir == 1 && board[nx-1][ny] == 1) {
                    continue
                }
                
                array.append(Robot(x: nx, y: ny, direction: dir, time: time+1))
                visited[nx][ny][dir] = true
            }
            
            if dir == 0 {
                if x > 0 && board[x-1][y-1] == 0 && board[x-1][y] == 0 && !visited[x][y][1] {
                    array.append(Robot(x: x, y: y, direction: 1, time: time+1))
                    visited[x][y][1] = true
                }
                
                if x < size - 1 && board[x+1][y-1] == 0 && board[x+1][y] == 0 && !visited[x+1][y][1] {
                    array.append(Robot(x: x+1, y: y, direction: 1, time: time+1))
                    visited[x+1][y][1] = true
                }
                
                if x > 0 && board[x-1][y] == 0 && board[x-1][y-1] == 0 && !visited[x][y-1][1] {
                    array.append(Robot(x: x, y: y-1, direction: 1, time: time+1))
                    visited[x][y-1][1] = true
                }
                
                if x < size-1 && board[x+1][y] == 0 && board[x+1][y-1] == 0 && !visited[x+1][y-1][1] {
                    array.append(Robot(x: x+1, y: y-1, direction: 1, time: time+1))
                    visited[x+1][y-1][1] = true
                }
            }
            if dir == 1 {
                if y > 0 && board[x-1][y-1] == 0 && board[x][y-1] == 0 && !visited[x][y][0] {
                    array.append(Robot(x: x, y: y, direction: 0, time: time+1))
                    visited[x][y][0] = true
                }
                
                if y < size-1 && board[x-1][y+1] == 0 && board[x][y+1] == 0 && !visited[x][y+1][1] {
                    array.append(Robot(x: x, y: y+1, direction: 0, time: time+1))
                    visited[x][y+1][0] = true
                }
                
                if y > 0 && board[x][y-1] == 0 && board[x-1][y-1] == 0 &&  !visited[x-1][y][1] {
                    array.append(Robot(x: x-1, y: y, direction: 0, time: time+1))
                    visited[x-1][y][0] = true
                }
                
                if y < size-1 && board[x][y+1] == 0 && board[x-1][y+1] == 0 &&  !visited[x-1][y+1][1] {
                    array.append(Robot(x: x-1, y: y+1, direction: 0, time: time+1))
                    visited[x-1][y+1][0] = true
                }
            }
            
        }
        
        return -1
    }
    */
    
    func isValidRange(_ x: Int, _ y: Int, _ size: Int) -> Bool {
        if x >= 0 && y >= 0 && x < size && y < size  {
            return true
        }
        return false
    }
    
    func isFinish(_ x: Int, _ y: Int, _ size: Int) -> Bool {
        if x == size - 1 && y == size - 1 {
            return true
        }
        return false
    }
    
    func isWall(_ x: Int, _ y: Int, _ array: [[Int]]) -> Bool {
        if array[x][y] == 1 {
            return true
        }
        return false
    }
    
    
}

struct Robot {
    var x: Int
    var y: Int
    var direction: Int
    var time: Int
}
