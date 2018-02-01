

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

/*
 */
class Solution {
    func isUgly(_ num: Int) -> Bool {
        guard num > 0 else {
            return false;
        }
        var result = num;
        while result%2 == 0 {
            result = result/2;
        }
        while result%3 == 0 {
            result = result/3;
        }
        while result%5 == 0 {
            result = result/5;
        }
        return result == 1;
    }
}

let s = Solution();

print(s.isUgly(2147483647))
