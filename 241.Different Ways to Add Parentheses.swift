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
    func diffWaysToCompute(_ input: String) -> [Int] {
        
        var result = [Int]();
        
        //判断是否只有数字，递归运算后最后会拆分只剩下数字
        if let num = Int(input) {
            result.append(num);
        }
        
        for index in input.indices {
            let c = input[index];
            if c == "+" || c == "-" || c == "*" {
                //以运算符号为分隔，前面字符串和后面字符串分别计算结果，返回值两两组合
                for a in diffWaysToCompute(String(input[input.startIndex ..< index])) {
                    for b in diffWaysToCompute(String(input[input.index(index, offsetBy: 1) ..< input.endIndex])) {
                        if c == "+" {
                            result.append(a+b);
                        }
                        else if c == "-" {
                            result.append(a-b);
                        }
                        else if c == "*" {
                            result.append(a*b);
                        }
                    }
                }
            }
        }
        
        return result;
    }
}

let s = Solution();
print(s.diffWaysToCompute("2*3-4*5"))
