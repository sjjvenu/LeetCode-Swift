

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
 遇0时入栈，遇1时把后一个数合起来入栈，最后判断栈底数字是否为0即可
 */
class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        guard bits.count > 0 else {
            return false;
        }
        var result = [Int]();
        var i = 0;
        while i < bits.count {
            if bits[i] == 0 {
                result.append(bits[i])
            }
            else {
                if i+1 < bits.count {
                    if bits[i+1] == 1 {
                        result.append(11);
                    }
                    else {
                        result.append(10);
                    }
                    i += 1;
                }
            }
            i += 1;
        }
        return result.last == 0;
    }
}

let s = Solution();
print(s.isOneBitCharacter([1, 1, 1, 0]))
