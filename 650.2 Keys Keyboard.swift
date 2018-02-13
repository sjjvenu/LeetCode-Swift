//
//  main.swift
//  LeetCode-Swift
//
//  Created by sjjvenu on 28/01/2018.
//  Copyright © 2018 com.sjjvenu. All rights reserved.
//

import Foundation

/*
 统计出规律，所求结果为n的乘法因子的和（如果是质数则为质数本身）
 */
class Solution {
    func minSteps(_ n: Int) -> Int {
        guard n > 1 else {
            return 0;
        }
        let result = helper(num: n);
        var sum = 0;
        for i in 0..<result.count {
            sum += result[i];
        }
        return sum;
    }
    //求乘法因子
    func helper(num:Int) -> [Int] {
        var result = [Int]();
        var varNum = num;
        if varNum%2 == 0 {
            while varNum%2 == 0 {
                result.append(2);
                varNum = varNum/2;
            }
        }
        var i = 3;
        while i <= Int(sqrt(Double(varNum))) {
            if varNum%i == 0 {
                result.append(i);
                result += helper(num: varNum/i);
                return result;
            }
            i += 2;
        }
        if varNum != 1 {
            result.append(varNum);
        }
        return result;
    }
}

let s = Solution();

print(s.minSteps(14))

