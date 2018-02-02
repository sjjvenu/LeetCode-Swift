

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
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0;
        }
        return travel(root, 1);
    }
    
    func travel(_ root: TreeNode?,_ level:Int) -> Int {
        //如果根结点为空，返回上一层数
        guard root != nil else {
            return level-1;
        }
        var result = level;
        //根结点为叶子，返回当前层数
        if root!.left == nil && root!.right == nil {
            return result;
        }
        else {
            //求取左结点和右结点的层数较小值
            var left = Int.max;
            var right = Int.max;
            if root!.left != nil {
                left = travel(root!.left, level+1)
            }
            if root!.right != nil {
                right = travel(root!.right, level+1)
            }
            result = min(left, right);
        }
        
        return result;
    }
}

let s = Solution();
let root = TreeNode(1);let r1 = TreeNode(1);let r2 = TreeNode(1);let r3 = TreeNode(1);let r4 = TreeNode(1);let l1 = TreeNode(1);let l2 = TreeNode(1);
root.left = l1;//root.right = r1;l1.right = r2;l1.left = r3;r3.left = r4;
print(s.minDepth(root))
