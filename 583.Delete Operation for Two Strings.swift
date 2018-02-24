

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
 参考 97. Interleaving String
 */
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: word2.count+1), count: word1.count+1);
        for i in 0...word1.count {
            for j in 0...word2.count {
                if i == 0 || j == 0{
                    continue;
                }
                if word1[word1.index(word1.startIndex, offsetBy: i-1)] == word2[word2.index(word2.startIndex, offsetBy: j-1)] {
                    dp[i][j] = dp[i-1][j-1] + 1;
                }
                else {
                    dp[i][j] = max(dp[i][j-1], dp[i-1][j]);
                }
            }
        }
        return word1.count+word2.count-2*dp[word1.count][word2.count];
    }
}

