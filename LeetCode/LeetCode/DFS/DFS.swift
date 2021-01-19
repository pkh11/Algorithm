//
//  DFS.swift
//  LeetCode
//
//  Created by 박균호 on 2021/01/19.
//

import Foundation

class DFS {
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
