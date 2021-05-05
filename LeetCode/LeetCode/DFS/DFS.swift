//
//  DFS.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/19.
//

import Foundation

class DFS {
    
    var result = 0
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        // 29, 98, 80
        
//        print(forbidden.sorted(by: <))
//        frugJumps(forbidden, a, x, a, b, 0)
        var forbidden = forbidden
        var queue = [(Int, Int, Bool)]()
        
        while !queue.isEmpty {
            let obj = queue.removeFirst()
            let now = obj.0
            
            let next = now + a
            let prev = now - b
            let step = obj.1
            let canGoBack = obj.2
            
            if now == x { return step }
            if forbidden.contains(now) { continue }
            forbidden.append(now)
            
            if !forbidden.contains(next) {
                queue.append((next, step+1, true))
            }
            
            if !forbidden.contains(prev) && prev >= 0 && canGoBack {
                queue.append((prev, step+1, false))
            }
            
        }
        
        return -1
    }
    
    func frugJumps(_ forbidden: [Int], _ now: Int, _ target: Int, _ forward: Int, _ backword: Int, _ step: Int) {
        print(now)
        if forbidden.contains(now) || now < 0 {
//            result = -1
            return
        }
        
        if now == target {
            result = step
            return
        }
        
        frugJumps(forbidden, now+forward, target, forward, backword, step+1)
        frugJumps(forbidden, now-backword, target, forward, backword, step+1)

    }
    
    
    var count = 0
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        isGoodNodes(root, root.val)
        return count
    }
    
    func isGoodNodes(_ root: TreeNode?, _ maxVal: Int) {
        guard let root = root else { return }
        let value = root.val
        var maxValue = maxVal
        
        if value >= maxValue {
            maxValue = value
            count += 1
        }
        
        if let leftNode = root.left {
            isGoodNodes(leftNode, maxValue)
        }
        
        if let rightNode = root.right {
            isGoodNodes(rightNode, maxValue)
        }
    }
    
    var time = 0
    
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        
//        var trees: [Int:AppleTree] = [:]
        var trees = Array(repeating: AppleTree((0,false)), count: n)
        var visited = Array(repeating: false, count: n)
        
        for i in 0..<n {
            trees[i] = AppleTree((i, hasApple[i]))
        }
          
        for edge in edges {
            let start = edge[0]
            let end = edge[1]
            
            trees[start].childrens.append(trees[end])
            trees[end].childrens.append(trees[start])
        }
        
//        for i in 0..<trees.count {
//            print("\(trees[i].vertex.0)")
//            for j in 0..<trees[i].childrens.count {
//                print("\(trees[i].childrens[j].vertex)")
//            }
//        }
        
        visited[0] = true
        return dfs(trees, hasApple, &visited, 0)
    }
    
    func dfs(_ tree: [AppleTree], _ hasApple: [Bool], _ visited: inout [Bool],_ current: Int) -> Int {
//        guard let node = tree else { return 0 }
        
        var result = 0
        
//        print("현재 \(current)//")
        for index in 0..<tree[current].childrens.count {
            let childIndex = tree[current].childrens[index].vertex.0
//            print(childIndex)
            if !visited[childIndex] {
                visited[childIndex] = true
                result += dfs(tree, hasApple, &visited, childIndex)
            }
        }
        
//        print(result)
        
        if hasApple[current] {
            if current == 0 {
                return result
            } else {
                return result + 2
            }
        } else {
            if current == 0 {
                return result
            } else {
                if result == 0 {
                    return 0
                } else {
                    return result + 2
                }
            }
        }
    }
    
    class AppleTree {
        var vertex: (Int,Bool)
        var childrens: [AppleTree] = []
        
        init(_ vertex: (Int,Bool)) {
            self.vertex = vertex
        }
    }
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        // dfs.canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
        var visited = Array(repeating: false, count: rooms.count)
        visitRooms(rooms, &visited, 0)
        
        if visited.contains(false) {
            return false
        }
        return true
    }
    func visitRooms(_ rooms: [[Int]], _ visited: inout [Bool], _ index: Int) {
        visited[index] = true
        
        let childs = rooms[index]
        
        for i in 0..<childs.count {
            let roomNum = childs[i]
            if !visited[roomNum] {
                visitRooms(rooms, &visited, roomNum)
            }
        }
        
    }
    
    func largestValues_DFS(_ root: TreeNode?, _ result: inout [Int], _ depth: Int) {
        guard let root = root else { return }
        
        if depth == result.count {
            result.append(root.val)
        } else {
            result[depth] = max(result[depth], root.val)
        }
        
        largestValues_DFS(root.left, &result, depth+1)
        largestValues_DFS(root.right, &result, depth+1)
    }
    
    func largestValues_BFS(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var result = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            
            var max = Int.min
            
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                
                if max < node.val {
                    max = node.val
                }
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            
            result.append(max)
        }
        
        print(result)
        
        return result
    }
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        //        return largestValues_BFS(root)
        var result = [Int]()
        largestValues_DFS(root, &result, 0)
        return result
    }
    
    // 위에서부터 시계방향(8방향)
    var dx = [-1, -1, 0, 1, 1, 1, 0, -1]
    var dy = [0, 1, 1, 1, 0, -1, -1, -1]
    
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        
        var board = board
        let width = board[0].count // 가로
        let height = board.count // 세로
        
        // start
        findMine(&board, click[0], click[1], width, height)
        
        return board
    }
    
    func findMine(_ board: inout [[Character]], _ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        
        if board[x][y] == "M" {
            board[x][y] = "X"
            return
        }
        
        if board[x][y] == "E" {
            board[x][y] = "B"
        }
        
        var count = 0
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < height && ny < width {
                if board[nx][ny] == "M" {
                    count += 1
                }
            }
        }
        
        if count > 0 {
            board[x][y] = Character("\(count)")
        } else {
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx >= 0 && ny >= 0 && nx < height && ny < width {
                    if board[nx][ny] == "E" {
                        // dfs
                        findMine(&board, nx, ny, width, height)
                    }
                }
            }
        }
    }
    
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var mostLeftValue = 0
        
        while !queue.isEmpty {
            for i in 0..<queue.count {
                let node = queue.removeFirst()
                
                if i == 0 {
                    mostLeftValue = node.val
                }
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
        }
        
        return mostLeftValue
    }
    
    
    // [key:[[dx], [dy]]]
    let streets: [Int:[[Int]]] = [1: [[0,0,0,0],
                                      [0,1,0,-1]],
                                  2: [[-1,0,1,0],
                                      [0,0,0,0]],
                                  3: [[0,0,1,0],
                                      [0,0,0,-1]],
                                  4: [[0,0,1,0],
                                      [0,1,0,0]],
                                  5: [[-1,0,0,0],
                                      [0,0,0,-1]],
                                  6: [[-1,0,0,0],
                                      [0,1,0,0]]]
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        
        // key: street 번호
        // value: 갈 수 있는 방향 (위, 오, 아래, 왼)
        // direction: [0, 1, 2, 3]
        
        let streetNumber = grid[0][0]
        let width = grid[0].count
        let height = grid.count
        
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        if streetNumber == 1 {
            dfs(grid, 1, grid[0][0], &visited, 0, 0, width, height)
        } else if streetNumber == 2 {
            dfs(grid, 2, grid[0][0], &visited, 0, 0, width, height)
        } else if streetNumber == 3 {
            dfs(grid, 2, grid[0][0], &visited, 0, 0, width, height)
        } else if streetNumber == 4 {
            dfs(grid, 1, grid[0][0], &visited, 0, 0, width, height)
            dfs(grid, 2, grid[0][0], &visited, 0, 0, width, height)
        } else if streetNumber == 5 {
            return false
        } else {
            dfs(grid, 1, grid[0][0], &visited, 0, 0, width, height)
        }
        
        if visited[height-1][width-1] {
            return true
        }
        
        return false
    }
    
    func dfs(_ map: [[Int]], _ nextDirection: Int, _ streetNumber: Int, _ visited: inout [[Bool]], _ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        
        visited[x][y] = true
        
        if x == height - 1 && y == width - 1 {
            return
        }
        
        let currentStreetNumber = map[x][y] // key
        let directions = streets[currentStreetNumber]!
        
        let dx = directions[0]
        let dy = directions[1]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < height && ny >= 0 && ny < width {
                if !visited[nx][ny] && isGo(currentStreetNumber, i, map[nx][ny]) {
                    dfs(map, i, currentStreetNumber, &visited, nx, ny, width, height)
                }
            }
        }
    }
    
    func isGo(_ streetNumber: Int, _ direction: Int, _ nextStreetNumber: Int) -> Bool {
        if streetNumber == 1 {
            if direction == 1 {
                if nextStreetNumber == 1 || nextStreetNumber == 3 || nextStreetNumber == 4 {
                    return true
                }
            } else if direction == 3 {
                if nextStreetNumber == 1 || nextStreetNumber == 4 || nextStreetNumber == 6 {
                    return true
                }
            }
        } else if streetNumber == 2 {
            if direction == 0 {
                if nextStreetNumber == 2 || nextStreetNumber == 3 || nextStreetNumber == 4 {
                    return true
                }
            } else if direction == 2 {
                if nextStreetNumber == 2 || nextStreetNumber == 5 || nextStreetNumber == 6 {
                    return true
                }
            }
        } else if streetNumber == 3 {
            if direction == 2 {
                if nextStreetNumber == 2 || nextStreetNumber == 5 || nextStreetNumber == 6 {
                    return true
                }
            } else if direction == 3 {
                if nextStreetNumber == 1 || nextStreetNumber == 4 || nextStreetNumber == 6 {
                    return true
                }
            }
        } else if streetNumber == 4 {
            if direction == 1 {
                if nextStreetNumber == 1 || nextStreetNumber == 3 || nextStreetNumber == 5 {
                    return true
                }
            } else if direction == 2 {
                if nextStreetNumber == 2 || nextStreetNumber == 5 || nextStreetNumber == 6 {
                    return true
                }
            }
        } else if streetNumber == 5 {
            if direction == 0 {
                if nextStreetNumber == 2 || nextStreetNumber == 3 || nextStreetNumber == 4 {
                    return true
                }
            } else if direction == 3 {
                if nextStreetNumber == 1 || nextStreetNumber == 4 || nextStreetNumber == 6 {
                    return true
                }
            }
        } else {
            if direction == 0 {
                if nextStreetNumber == 2 || nextStreetNumber == 3 || nextStreetNumber == 4 {
                    return true
                }
            } else if direction == 1 {
                if nextStreetNumber == 1 || nextStreetNumber == 3 || nextStreetNumber == 5 {
                    return true
                }
            }
        }
        return false
    }
    
    func maxLevelSum(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        
        var result = [Int:Int]()
        var level = 1
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            
            var sum = 0
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                sum += node.val
                
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            
            result[level] = sum
            level+=1
        }
        
        return result.max(by: { $0.value < $1.value }).map{ $0.key }!
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return getTotalSum(root, 0, targetSum)
    }
    
    func getTotalSum(_ root: TreeNode?, _ currentSum: Int, _ totalSum: Int) -> Bool {
        guard let root = root else { return false }
        
        let sum = root.val + currentSum
        
        if root.left == nil && root.right == nil && sum == totalSum {
            return true
        }
        if getTotalSum(root.left, sum, totalSum) {
            return true
        }
        if getTotalSum(root.right, sum, totalSum) {
            return true
        }
        return false
    }
    
    var sum = 0
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        
        dfsRecursion(id, employees)
        
        return sum
    }
    
    func dfsRecursion(_ id: Int, _ employees: [Employee]) {
        // 찾고자 하는 직원 index 가져오기
        guard let index = employees.firstIndex(where: { $0.id == id }) else { return }
        
        // 해당 index의 직원 importance 더하기
        sum += employees[index].importance
        
        // 해당 index의 직원의 부하 직원정보 재귀호출
        for e in employees[index].subordinates {
            dfsRecursion(e, employees)
        }
    }
    
    //    var dic = [Int: Employee]()
    //    var result = 0
    //    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
    //
    //        for employee in employees {
    //            dic[employee.id] = employee
    //        }
    //
    //        sumOfImportance(dic, id)
    //
    //        return result
    //    }
    //
    //    func sumOfImportance(_ dic: [Int: Employee], _ target: Int) {
    //        guard let employee = dic[target] else { return }
    //
    //        result += employee.importance
    //
    //        for sub in employee.subordinates {
    //            sumOfImportance(dic, sub)
    //        }
    //    }
    
    
    //    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    //        // cousins : same depth , different parent
    //
    //        var xDepth = 1
    //        var yDepth = 1
    //        var xParent: TreeNode?
    //        var yParent: TreeNode?
    //
    //        func findCousins(_ root: (TreeNode?, Int), _ x: Int, _ y: Int,_ parent: TreeNode?) {
    //
    //            guard let root = root as? (TreeNode, Int) else { return }
    //
    //            if root.0.val == x {
    //                xDepth = root.1
    //                xParent = parent
    //            }
    //            if root.0.val == y {
    //                yDepth = root.1
    //                yParent = parent
    //            }
    //
    //            findCousins((root.0.left, root.1 + 1), x, y, root.0)
    //            findCousins((root.0.right, root.1 + 1), x, y, root.0)
    //        }
    //
    //
    //        findCousins((root, 1), x, y, nil)
    //
    //        if xDepth == yDepth && xParent?.val != yParent?.val { return true }
    //
    //        return false
    //    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
        guard let root = root else {
            return false
        }
        
        var queue: [TreeNode] = [root]
        var xParent: Int?
        var yParent: Int?
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for _ in 0..<queue.count {
                if let leftNode = node.left {
                    queue.append(leftNode)
                    if leftNode.val == x {
                        xParent = node.val
                    } else if leftNode.val == y {
                        yParent = node.val
                    }
                }
                
                if let rightNode = node.right {
                    queue.append(rightNode)
                    if rightNode.val == x {
                        xParent = node.val
                    } else if rightNode.val == y {
                        yParent = node.val
                    }
                }
            }
            
            if xParent != nil && yParent != nil && xParent != yParent {
                return true
            }
            
            xParent = nil
            yParent = nil
        }
        
        return false
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        var queue = [(TreeNode?, Int)]()
        queue.append((root, 1))
        
        while !queue.isEmpty {
            let tuple = queue.removeFirst()
            let node = tuple.0
            let depth = tuple.1
            
            if node?.left == nil && node?.right == nil {
                return depth
            }
            
            if let leftNode = node?.left {
                queue.append((leftNode, depth + 1))
            }
            if let rightNode = node?.right {
                queue.append((rightNode, depth + 1))
            }
        }
        
        
        return 0
    }
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        guard let root = root else { return true }
        
        
        
        return true
    }
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        // BFS
        guard let root = root else {
            return 0
        }
        
        var result = 0
        var queue = [TreeNode]()
        
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let leftNode = node.left {
                if leftNode.left == nil && leftNode.right == nil {
                    result += leftNode.val
                } else {
                    queue.append(leftNode)
                }
            }
            if let rightNode = node.right {
                if rightNode.left != nil || rightNode.right != nil {
                    queue.append(rightNode)
                }
            }
        }
        
        return result
    }
    
    //    func isSymmetric(_ root: TreeNode?) -> Bool {
    //
    //        guard root != nil else { return true }
    //
    //        var queue = [TreeNode?]()
    //        queue.append(root?.left)
    //        queue.append(root?.right)
    //
    //        while !queue.isEmpty {
    //            var leftNode = queue.removeFirst()
    //            var rightNode = queue.removeFirst()
    //
    //            if leftNode == nil && rightNode == nil { continue }
    //            if leftNode == nil || rightNode == nil { return false }
    //            if leftNode?.val != rightNode?.val { return false }
    //
    //            queue.append(leftNode?.left)
    //            queue.append(rightNode?.right)
    //            queue.append(leftNode?.right)
    //            queue.append(rightNode?.left)
    //        }
    //        print(queue)
    //        return true
    //    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        guard let root = root else { return true }
        
        return isSymmetricDFS(root.left, root.right)
    }
    
    func isSymmetricDFS(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        
        guard let leftNode = left, let rightNode = right else { return left === right }
        
        if leftNode.val != rightNode.val { return false }
        
        return isSymmetricDFS(leftNode.left, rightNode.right) && isSymmetricDFS(leftNode.right, rightNode.left)
    }
    
    
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        guard !nums.isEmpty else {
            return nil
        }
        
        let mid = nums.count / 2
        let tree = TreeNode(nums[mid])
        
        tree.left = sortedArrayToBST(Array(nums[0..<mid]))
        tree.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        
        return tree
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p?.val == nil && q?.val == nil {
            return true
        }
        
        if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        
        return false
    }
    
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        
        var depth = 0
        for child in root.children {
            depth = max(depth, maxDepth(child))
        }
        
        return depth + 1
    }
}
