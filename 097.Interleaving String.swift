

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
 See solution
 */
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else {
            return false;
        }
        if s1.count == 0 && s2.count == 0 && s3.count == 0 {
            return true;
        }
        var dp = [[Bool]].init(repeating: [Bool].init(repeating: false, count: s2.count+1), count: s1.count+1);
        for i in 0...s1.count {
            for j in 0...s2.count {
                if i == 0 && j == 0 {
                    dp[i][j] = true;
                }
                else if i == 0 {
                    dp[i][j] = dp[i][j-1] && s2[s2.index(s2.startIndex, offsetBy: j-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)];
                }
                else if j == 0 {
                    dp[i][j] = dp[i-1][j] && s1[s1.index(s1.startIndex, offsetBy: i-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)];
                }
                else {
                    dp[i][j] = (dp[i][j-1] && s2[s2.index(s2.startIndex, offsetBy: j-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)]) || (dp[i-1][j] && s1[s1.index(s1.startIndex, offsetBy: i-1)] == s3[s3.index(s3.startIndex, offsetBy: i+j-1)]);
                }
            }
        }
        
        return dp[s1.count][s2.count];
    }
}

let s = Solution();
//let root = TreeNode(1);let r1 = TreeNode(1);let r2 = TreeNode(1);let r3 = TreeNode(1);let r4 = TreeNode(1);let l1 = TreeNode(1);let l2 = TreeNode(1);
//root.left = l1;root.right = r1;l1.right = r2;l1.left = r3;r3.left = r4;bbbbbabbbbabaababaaaabbababbaaabbabbaaabaaaaababbbababbbbbabbbbababbabaabababbbaabababababbbaaababaa、babaaaabbababbbabbbbaabaabbaabbbbaabaaabaababaaaabaaabbaaabaaaabaabaabbbbbbbbbbbabaaabbababbabbabaab、babbbabbbaaabbababbbbababaabbabaabaaabbbbabbbaaabbbaaaaabbbbaabbaaabababbaaaaaabababbababaababbababbbababbbbaaaabaabbabbaaaaabbabbaaaabbbaabaaabaababaababbaaabbbbbabbbbaabbabaabbbbabaaabbababbabbabbab
print(s.isInterleave("a",
    "",
    "a"))
