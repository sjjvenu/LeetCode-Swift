

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

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

 
/*
 */
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        guard J.count > 0 && S.count > 0 else {
            return 0;
        }
        var count = 0;
        for c in S {
            if J.contains(c) {
                count += 1;
            }
        }
        return count;
    }
}

let s = Solution();
print(s.numJewelsInStones("aA", "aAAbbbb"))
