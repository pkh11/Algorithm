//
//  DFS.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/19.
//

import Foundation

class DFS {
    
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
    
    func makeTree(_ num: Int) {
        
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
