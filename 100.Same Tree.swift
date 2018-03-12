/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return getTreeString(p) == getTreeString(q);
    }
    
    func getTreeString(_ root:TreeNode?) -> String {
        guard root != nil else {
            return "null";
        }
        return String(root!.val) + "l" + getTreeString(root!.left) + "r" + getTreeString(root!.right);
    }
}
