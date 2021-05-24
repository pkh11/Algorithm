//
//  No1.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/15.
//

import Foundation

class KaKaoEnterpriseNo1 {
//    func condense(head: SinglyLinnkedListNode?) -> SinglyLinnkedListNode {
//        
//        
//        var current: SinglyLinnkedListNode? = head
//        var previous: SinglyLinnkedListNode? = nil
//        
//        var set = Set<Int>()
//        
//        while current != nil {
//            if set.contains(current!.data) {
//                previous?.next = current?.next
//            } else {
//                set.insert(current!.data)
//                previous = current
//            }
//            current = previous?.next
//        }
//        
//        
//        
//        return
//    }
    
    class SinglyLinnkedListNode {
        var data: Int = 0
        var next: SinglyLinnkedListNode?
    }
}
