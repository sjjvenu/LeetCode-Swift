
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
 Suppose for sequences ending at nums[i], we knew the length length[i] of the longest sequence, and the number count[i] of such sequences with that length.
 
 For every i < j with A[i] < A[j], we might append A[j] to a longest subsequence ending at A[i]. It means that we have demonstrated count[i] subsequences of length length[i] + 1.
 
 Now, if those sequences are longer than length[j], then we know we have count[i] sequences of this length. If these sequences are equal in length to length[j], then we know that there are now count[i] additional sequences to be counted of that length (ie. count[j] += count[i]).
 */
class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let count = nums.count;
        if count <= 1 {
            return count;
        }
        var lengths = [Int].init(repeating: 0, count: count);
        var counts = [Int].init(repeating: 1, count: count);
        
        for j in 0 ..< count {
            for i in 0 ..< j {
                if nums[i] < nums[j] {
                    if lengths[i] >= lengths[j] {
                        lengths[j] = lengths[i] + 1;
                        counts[j] = counts[i];
                    }
                    else if lengths[i] + 1 == lengths[j] {
                        counts[j] += counts[i];
                    }
                }
            }
        }
        
        var ans = 0,longest = 0;
        for length in lengths {
            longest = max(longest, length);
        }
        for i in 0 ..< count {
            if lengths[i] == longest {
                ans += counts[i];
            }
        }
        
        return ans;
    }
}

let s = Solution();
print(s.findNumberOfLIS([1,3,5,4,7]))
