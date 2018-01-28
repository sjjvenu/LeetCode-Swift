//
//  main.swift
//  LeetCode-Swift
//
//  Created by sjjvenu on 28/01/2018.
//  Copyright © 2018 com.sjjvenu. All rights reserved.
//

import Foundation

/*
 所有的数字都可以拆分成2和3就可以了，优先拆分成3。首先对3取余，如果正好除尽，则结果全部用3相乘；如果余1，结果用3相乘count-1次，最后乘4；如果余2，则用3相乘count次后，结果乘2
 */
class Solution {
    func integerBreak(_ n: Int) -> Int {
        if n == 2 {
            return 1;
        }
        if n == 3 {
            return 3;
        }
        var result = 1;
        let count = Int(n/3);
        for _ in 0 ..< count {
            result *= 3;
        }
        if (n%3 == 1) {
            result /= 3;
            result *= 4;
        }
        else if (n%3 == 2) {
            result *= 2;
        }
        return result;
    }
}

let s = Solution();

print(s.integerBreak(10))

