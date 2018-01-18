//
//  main.swift
//  testSwitCommandLineTool
//
//  Created by tdx on 2017/12/12.
//  Copyright © 2017年 sjjvenu. All rights reserved.
//

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
    func findMode(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return [];
        }
        //遍历所有节点数据
        var result = helper(root);
        //统计数字出现的次数和最大重复数
        var dict = [Int:Int]();
        var maxCount = 1;
        for i in 0..<result.count {
            if dict[result[i]] == nil {
                dict[result[i]] = 1;
            }
            else {
                dict[result[i]]! += 1;
                if maxCount < dict[result[i]]! {
                    maxCount = dict[result[i]]!;
                }
            }
        }
        //选出与最大重复数相等的数字
        result.removeAll();
        for element in dict {
            if element.value == maxCount {
                result.append(element.key);
            }
        }
        
        return result;
    }
    
    func helper(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return [];
        }
        var result = [Int]();
        result.append(root!.val);
        result += helper(root?.left);
        result += helper(root?.right);
        return result;
    }
}

let root = TreeNode(-2147483648); let r1 = TreeNode(2); let r2 = TreeNode(2);let r3 = TreeNode(3); let r4 = TreeNode(3);
//root.right = r1;r1.left = r2;r1.right = r3;r3.right = r4;
let s = Solution();

print(s.findMode(root));
