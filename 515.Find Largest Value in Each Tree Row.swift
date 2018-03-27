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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return [];
        }
        var maxDic = [Int:Int]();
        helper(root,0,&maxDic);
        let sortedArray = maxDic.sorted{$0.key < $1.key};
        var result = [Int]();
        for obj in sortedArray {
            result.append(obj.value);
        }
        return result;
    }
    
    func helper(_ root: TreeNode?,_ floor: Int,_ maxDic: inout [Int:Int]) -> Void {
        guard root != nil else {
            return;
        }
        if maxDic[floor] != nil {
            if maxDic[floor]! < root!.val {
                maxDic[floor] = root!.val;
            }
        }
        else {
            maxDic[floor] = root!.val;
        }
        helper(root!.left,floor+1,&maxDic);
        helper(root!.right,floor+1,&maxDic);
    }
}
