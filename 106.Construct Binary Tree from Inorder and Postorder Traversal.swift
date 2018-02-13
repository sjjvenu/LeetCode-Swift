

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
 后序遍历最后一个为root结点，以此为分隔点分开中序遍历，前面为左节点，后面为右节点，左右节点分别递归
 */
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count == postorder.count && inorder.count > 0 else {
            return nil;
        }
        let root = TreeNode(postorder[postorder.count-1]);
        if let index = inorder.index(of: postorder[postorder.count-1]) {
            let dis = inorder.distance(from: inorder.startIndex, to: index);
            if dis < 0 || dis >= inorder.count {
                return nil;
            }
            let leftInorder = inorder[inorder.startIndex..<index];
            let leftPostorder = postorder[postorder.startIndex..<postorder.index(postorder.startIndex, offsetBy: dis)];
            if leftInorder.count > 0 && leftPostorder.count > 0{
                root.left = buildTree(Array(leftInorder), Array(leftPostorder));
            }
            let rightInorder = inorder[inorder.index(after: index)..<inorder.endIndex];
            let rightPostorder = postorder[postorder.index(postorder.startIndex, offsetBy: dis)..<postorder.index(before: postorder.endIndex)];
            if rightInorder.count > 0 && rightPostorder.count > 0{
                root.right = buildTree(Array(rightInorder), Array(rightPostorder));
            }
        }
        return root;
    }
}

let s = Solution();
print(s.buildTree([9,3,15,20,7],
    [9,15,7,20,3]))
