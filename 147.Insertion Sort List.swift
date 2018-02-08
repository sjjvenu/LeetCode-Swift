

import Foundation

/**
 * Definition for a binary tree node.
 */
// public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}

 /**
 * Definition for singly-linked list.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
 
/*
 */
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil;
        }
        let helper = ListNode(0);
        var cur = head;
        var pre = helper;
        var next:ListNode? = nil;
        
        while cur != nil {
            next = cur?.next;
            while pre.next != nil && pre.next!.val < cur!.val {
                pre = pre.next!;
            }
            cur?.next = pre.next;
            pre.next = cur;
            pre = helper;
            cur = next;
        }
        
        
        return helper.next;
    }
    
    func insertionSortList1(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil;
        }
        var result = [ListNode]();
        var p = head;
        while p != nil {
            result.append(p!);
            p = p!.next;
        }
        result.sort { (val1, val2) -> Bool in
            return val1.val < val2.val;
        }
        for i in 0..<result.count {
            if i < result.count-1 {
                result[i].next = result[i+1];
            }
            else {
                result[i].next = nil;
            }
        }
        return result[0];
    }
}

let s = Solution();
let l1 = ListNode(2);let l2 = ListNode(4);let l3 = ListNode(8);
l3.next = l1;l1.next = l2;
print(s.insertionSortList(l3))
