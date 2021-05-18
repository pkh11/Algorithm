//
//  LinkedList.swift
//  LeetCode
//
//  Created by Kyoon Ho Park on 2021/05/18.
//

import Foundation

class LinkedList {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    
        guard head != nil else { return head }
        
        var beforeHead = ListNode(-1)
        var before: ListNode? = beforeHead
        var afterHead = ListNode(-1)
        var after: ListNode? = afterHead
        
        var current = head
        
        while current != nil {
            guard let val = current?.val else { break }
            
            if val < x {
                before?.next = current
                before = before?.next
            } else {
                after?.next = current
                after = after?.next
            }
            
            current = current?.next
        }
        
        before?.next = afterHead.next
        after?.next = nil
        
        return beforeHead.next
    }
}
