

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
 */
class Solution {
    // Idea: Mark each element as negative as you go through the array, if an element
    // is already negative then you know you've seen that before
    // Runtime: O(n)
    // Space: O(1)
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        var nums = nums
        
        for i in 0..<nums.count {
            let val = abs(nums[i]) - 1
            
            if nums[val] < 0 {
                res.append(abs(nums[i]))
            } else {
                nums[val] = -nums[val]
            }
        }
        
        return res
    }
}

let s = Solution();
print(s.findDuplicates([4,3,2,7,8,2,3,1]))
