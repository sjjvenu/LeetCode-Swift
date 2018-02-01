
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
 
 
class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result = [Double]();
        var floorDic = [Int:Int]();
        travel(root, 0, &result,&floorDic);
        for i in 0..<result.count {
            if let count = floorDic[i] ,count > 0{
                result[i] = result[i]/Double(count);
            }
        }
        return result;
    }
    
    
    /// 计算每层总和与每层个数
    ///
    /// - Parameters:
    ///   - root: root节点
    ///   - floor: 层数
    ///   - array: 保存每层总和
    ///   - floorDic: 保存每层元素个数
    func travel(_ root: TreeNode?,_ floor:Int,_ array:inout [Double],_ floorDic:inout [Int:Int]) -> Void {
        guard root != nil else {
            return ;
        }
        if array.count > floor {
            array[floor] = array[floor] + Double(root!.val);
        }
        else {
            array.append(Double(root!.val));
        }
        if floorDic[floor] != nil {
            floorDic[floor]! += 1;
        }
        else {
            floorDic[floor] = 1;
        }
        travel(root?.left, floor+1, &array,&floorDic);
        travel(root?.right, floor+1, &array,&floorDic);
    }
}

let root = TreeNode(3); let l1 = TreeNode(0); let l2 = TreeNode(1);let l3 = TreeNode(2);
root.left = l2;l2.left = l1;l2.right = l3;
let r1 = TreeNode(5); let r2 = TreeNode(4);let r3 = TreeNode(6);
root.right = r1;r1.left = r2;r1.right = r3;
let s = Solution();

print(s.averageOfLevels(root));
