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
    var ans = Int.max;
    var minValue = -1;
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return -1;
        }
        minValue = root!.val;
        dfs(root);
        return ans < Int.max ? ans : -1;
    }
    
    func dfs(_ root: TreeNode?) -> Void {
        guard root != nil else {
            return;
        }
        if minValue < root!.val && ans > root!.val {
            ans = root!.val;
        }
        dfs(root!.left);
        dfs(root!.right);
    }
}
