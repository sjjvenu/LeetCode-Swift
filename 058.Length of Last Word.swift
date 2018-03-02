

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
    func lengthOfLastWord(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0;
        }
        var length = 0;
        var searchString = s;
        //remove tail space
        while let pos = searchString.range(of: " ", options: .backwards, range: nil, locale: nil), searchString.distance(from: pos.upperBound, to: searchString.endIndex) == 0 {
            searchString.removeLast();
        }
        if let pos = searchString.range(of: " ", options: .backwards, range: nil, locale: nil) {
            length = searchString.distance(from: pos.upperBound, to: searchString.endIndex);
        }
        else {
            length = searchString.count;
        }
        return length;
    }
}

let s = Solution();
print(s.lengthOfLastWord("a  abc  "))
