//
//  DFS.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/19.
//

import Foundation

class DFS {
//    let streets: [Int:[[Int]]] = [1: [[0,0,0,0],[0,1,0,-1]],
//                                2: [[1,0,-1,0], [0,0,0,0]],
//                                3: [0,0,1,1],
//                                4: [0,1,1,0],
//                                5: [1,0,0,1],
//                                6: [1,1,0,0]]
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        
        // key: street 번호
        // value: 갈 수 있는 방향 (위, 오, 아래, 왼)
        // direction: [0, 1, 2, 3]
        
        
        let row = grid[0].count
        let col = grid.count
        
        var visited = Array(repeating: Array(repeating: false, count: row), count: col)
        
        return false
    }
    
    func dfs(_ map: [[Int]], _ beforeDirection: Int, _ nextDirection: Int, _ streetNumber: Int, _ visited: inout [[Bool]], _ x: Int, _ y: Int) {
        visited[x][y] = true
        
        let currentStreetNumber = map[x][y]
//        let directions = streets[currentStreetNumber]!
        let street = map[x][y]
        
        for i in 0..<4 {
            /*
            if directions[i] == 1 && !visited[x][y] {
                var dx = x
                var dy = y
                if currentStreetNumber == 1 {
                    
                } else if currentStreetNumber == 2 {
                    
                } else if currentStreetNumber == 3 {
                    
                } else if currentStreetNumber == 4 {
                    
                } else if currentStreetNumber == 5 {
                    
                } else {
                    
                }
            }
            */
        }
        
        if beforeDirection == 0 {
            
        } else if beforeDirection == 1 {
            
        } else if beforeDirection == 2 {
            
        } else {
            
        }
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
