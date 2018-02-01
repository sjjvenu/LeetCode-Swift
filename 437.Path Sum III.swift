
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0;
        }
        
        return travelSum(root, 0, sum) + pathSum(root.left,sum) + pathSum(root.right,sum);
    }
    
    //对每个节点的左右和左右进行求和，判断是否和sum相等，如相等，则值+1
    func travelSum(_ root: TreeNode?,_ pre:Int,_ sum:Int) -> Int {
        guard let root = root else {
            return 0;
        }
        let current = pre + root.val;
        var count = 0;
        if current == sum {
            count += 1;
        }
        count += travelSum(root.left,current,sum);
        count += travelSum(root.right,current,sum);
        return count;
    }
}


let sol = Solution();
let root = TreeNode(10),l1 = TreeNode(5),l2 = TreeNode(3),l3 = TreeNode(2),l4=TreeNode(3),l5=TreeNode(-2),l6=TreeNode(1),
r1 = TreeNode(-3),r2=TreeNode(11);
root.left = l1;root.right = r1;l1.left = l2;l1.right = l3;l2.left=l4;l2.right=l5;l3.right=l6;r1.right=r2;

let result = sol.pathSum(root, 8);

print(result);
