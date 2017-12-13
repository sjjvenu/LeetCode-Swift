//
//  main.swift
//  testSwitCommandLineTool
//
//  Created by tdx on 2017/12/12.
//  Copyright © 2017年 tdx. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //思路，遍历数组，把遍历过程用字典存储起来，值作为key，索引为value，这样在下一次进行遍历的时候直接将target减去字典的key，如何能求到值，表示以前存储的字典存在结果，则返回
        var set = [Int: Int]()
        for i in 0..<nums.count {
            if let result = set[target - nums[i]] {
                return [result, i]
            }
            set[nums[i]] = i
        }
        return []
    }
}

let sol = Solution();
let result = sol.twoSum([2,11,7,5], 9);

print(result);
