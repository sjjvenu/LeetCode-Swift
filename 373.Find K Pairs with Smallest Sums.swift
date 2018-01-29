//
//  main.swift
//  testSwitCommandLineTool
//
//  Created by tdx on 2018/1/29.
//  Copyright © 2018年 sjjvenu. All rights reserved.
//

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
 */
class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        if k <= 0 || nums1.isEmpty || nums2.isEmpty {
            return []
        }
        
        let cnt = min(k, nums1.count * nums2.count)
        var index = Array(repeatElement(0, count: nums1.count))
        var pairs: [[Int]] = []
        var n = 0
        
        while n < cnt {
            var min = Int.max
            var m = 0
            for i in 0..<nums1.count {
                if index[i] < nums2.count && nums1[i]+nums2[index[i]] < min {
                    min = nums1[i]+nums2[index[i]]
                    m = i
                }
            }
            pairs.append([nums1[m], nums2[index[m]]])
            index[m] += 1
            n += 1
        }
        
        return pairs
    }
}

let s = Solution();
print(s.kSmallestPairs([1,1,2],
    [1,2,3],
    10))
