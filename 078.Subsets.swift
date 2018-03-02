

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
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return [];
        }
        var result = [[Int]]();
        
        if nums.count == 1 {
            result.append([]);
            result.append([nums[0]]);
        }
        else {
            result.append([]);
            result.append([nums[0]]);
            result = union(result, subsets(Array(nums[nums.index(after: nums.startIndex)..<nums.endIndex])));
        }
        
        return result;
    }
    
    func union(_ num1: [[Int]] ,_ num2: [[Int]]) -> [[Int]] {
        guard num1.count > 0 && num2.count > 0 else {
            return [[]];
        }
        var result = [[Int]]();
        for m in num1 {
            for n in num2 {
                result.append(m+n);
            }
        }
        
        return result;
    }
}

let s = Solution();
print(s.subsets([1,2,3]))
