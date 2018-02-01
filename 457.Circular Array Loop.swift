

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
 从索引为0开始计算每个索引所经过的值并入数组，如果遇到相同的则判断是否为所求loop。循环时如遇到前面已计算的索引，则可跳过计算下一索引的值
 */
class Solution {
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else {
            return false;
        }
        
        for i in 0 ..< nums.count {
            var next = (i + nums[i])%nums.count;
            let forward = nums[i] > 0;
            if forward == false {
                next = (i + nums.count - abs(nums[i])%nums.count)%nums.count;
            }
            var list = [Int]();
            list.append(i);
            while list.contains(next) == false {
                list.append(next);
                if (nums[next] > 0) == forward {
                    if forward {
                        next = (next + nums[next])%nums.count;
                    }
                    else {
                        next = (next + nums.count - abs(nums[next])%nums.count)%nums.count;
                    }
                    
                }
                else {
                    break;
                }
            }
            if list.count > 1 && next <= i && next-1 >= 0 && next < list.count &&  list[list.count-1] != next {
                return true;
            }
            
        }
        
        return false;
    }
}

let s = Solution();

print(s.circularArrayLoop([-1,-2,-3,-4,-5]))
