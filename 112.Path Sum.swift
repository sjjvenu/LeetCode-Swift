

import Foundation

/**
 * Definition for a binary tree node.
 */
 public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/*
 */
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard root != nil else {
            return false;
        }
        //如果是叶子结果，且传进来的sum为0，则找到所求值
        if sum - root!.val == 0 && root?.left == nil && root?.right == nil{
            return true;
        }
        //遍历时减去根的值，方便子节点对比
        return hasPathSum(root!.left,sum-root!.val) || hasPathSum(root!.right,sum-root!.val);
    }
}

let s = Solution();
let root = TreeNode(5);let l1 = TreeNode(4);root.left = l1;let l2 = TreeNode(11);l1.left = l2;let l3 = TreeNode(7);l2.left = l3;let l4 = TreeNode(2);l2.right = l4;let r1 = TreeNode(8);root.right = r1;let r2 = TreeNode(13);r1.left = r2;let r3 = TreeNode(4);r1.right = r3;let r4 = TreeNode(1);r3.right = r4;
print(s.hasPathSum(root,22))
