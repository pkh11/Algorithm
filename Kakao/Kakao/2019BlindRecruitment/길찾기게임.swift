//
//  길찾기게임.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/17.
//

import Foundation

class 길찾기게임 {
        
    func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
        
        // value, x, y 정보
        var data = [(Int, Int, Int)]()
        
        for (index, node) in nodeinfo.enumerated() {
            data.append((index+1, node[0], node[1]))
        }
        
        let sorted = data.sorted {
            if $0.2 == $1.2 {
                return $0.1 < $1.1
            }
            return $0.2 > $1.2
        }
        
        let bst = BST()
        for node in sorted {
            bst.insert(node.0, node.1, node.2)
        }
        
        // inordered
        bst.inOrdered(bst.root)

        // postordered
        bst.postOrdered(bst.root)
        
        return [bst.inorderd, bst.postorderd]
    }
    
    class BST {
        var root: Node?
        var inorderd = [Int]()
        var postorderd = [Int]()
        
        func insert(_ value: Int, _ x: Int, _ y: Int) {
            guard let root = self.root else {
                return self.root = Node.init(value, nil, nil, x, y)
            }
            
            var currentNode = root
            while true {
                // left node
                if currentNode.x > x && currentNode.y > y {
                    guard let leftNode = currentNode.left else {
                        return currentNode.left = Node.init(value, nil, nil, x, y)
                    }
                    currentNode = leftNode
                } else if currentNode.x < x && currentNode.y > y {
                    // right node
                    guard let rightNode = currentNode.right else {
                        return currentNode.right = Node.init(value, nil, nil, x, y)
                    }
                    currentNode = rightNode
                }
            }
        }
        
        // root -> left -> right
        func inOrdered(_ root: Node?) {
            guard let node = root else { return }
            inorderd.append(node.value)
            inOrdered(node.left)
            inOrdered(node.right)
        }
        
        // left -> right -> root
        func postOrdered(_ root: Node?) {
            guard let node = root else { return }
            postOrdered(node.left)
            postOrdered(node.right)
            postorderd.append(node.value)
        }
    }

    class Node {
        var value: Int
        var left: Node?
        var right: Node?
        var x: Int
        var y: Int
        
        init(_ val: Int, _ left: Node?, _ right: Node?, _ x: Int, _ y: Int) {
            self.value = val
            self.left = left
            self.right = right
            self.x = x
            self.y = y
        }
    }
}


