
import Foundation

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

//使用递归方式遍历二叉树
class Solution {
    func isEqual(_ s1:TreeNode?,_ s2:TreeNode?) -> Bool {
        if (s1 == nil && s2 == nil)
        {
            return true;
        }
        if (s1 == nil || s2 == nil)
        {
            return false;
        }
        return (s1?.val == s2?.val) && isEqual(s1?.left,s2?.left) && isEqual(s1?.right,s2?.right);
    }
    
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        return traverse(s,t);
    }
    
    func traverse(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if (s == nil)
        {
            return false;
        }
        
        return isEqual(s,t) || traverse(s?.left,t) || traverse(s?.right,t);
    }
}

/*
               3                                4
           /       \                          /   \
          4         5                        nil   nil
        /   \      /  \
       1     2    nil nil
      / \   /  \
    nil nil nil nil
*/

//方法二将二叉树用nil补全，并标记有数值的左右节点，因为无论除了完全二叉树使用哪种遍历方式都不能确定一颗树为另一颗树的子集
class Solution2 {
    func convert2String(node:TreeNode?) -> String {
        if (node == nil)
        {
            return "nil";
        }
        return "#" + String(describing: node?.val) + "_l" + convert2String(node: node?.left) + "_r" + convert2String(node: node?.right);
    }
    
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if (s == nil || t == nil)
        {
            return false;
        }
        let sString = convert2String(node: s);
        let tString = convert2String(node: t);
        return sString.contains(tString);
    }
    
}

let sol = Solution();


