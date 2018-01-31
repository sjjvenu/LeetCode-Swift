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
    func getSum(_ a: Int, _ b: Int) -> Int {
        var sum = a;
        var m = a;
        var n = b;
        
        while (n != 0)
        {
            sum = m ^ n;//计算与
            n = (m & n) << 1;//计算进位
            m = sum;//如果进位为0，则求得结果，否则继续将与的结果和进位进行求和
        }
        
        return sum;
    }
}

let s = Solution();

print(s.getSum(2147483647,
    -2147483648))
