//
//  DFS.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/19.
//

import Foundation

class DFS {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        guard root != nil else { return true }
        
        var queue = [TreeNode?]()
        queue.append(root?.left)
        queue.append(root?.right)
        
        while !queue.isEmpty {
            var leftNode = queue.removeFirst()
            var rightNode = queue.removeFirst()
            
            if leftNode == nil && rightNode == nil { continue }
            if leftNode == nil || rightNode == nil { return false }
            if leftNode?.val != rightNode?.val { return false }
            
            queue.append(leftNode?.left)
            queue.append(rightNode?.right)
            queue.append(leftNode?.right)
            queue.append(rightNode?.left)
        }
        print(queue)
        return true
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
