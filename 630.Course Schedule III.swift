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
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        guard courses.count > 0 else {
            return 0;
        }
        //按照截止日期排序
        let sortCourse = courses.sorted { (value1, value2) -> Bool in
            if value1.count > 1 && value2.count > 1 {
                if value1[1] == value2[1] {
                    return value1[0] < value2[0];
                }
                return value1[1] < value2[1];
            }
            else {
                return false;
            }
        }
        
        var list = [Int]();
        var sumDays = 0;
        for i in 0 ..< sortCourse.count {
            let value = sortCourse[i];
            if value.count > 1 {
                //如果未超出截止日期加入队列
                if sumDays + value[0] <= value[1] {
                    list.append(value[0]);
                    sumDays += value[0];
                }
                else
                {
                    //超出截止日期，将原队列中最大值换出
                    list.sort();
                    if let lastValue = list.last , lastValue > value[0]{
                        sumDays -= lastValue;
                        list.removeLast();
                        list.append(value[0]);
                        sumDays += value[0];
                    }
                }
            }
        }
        return list.count;
    }
}

let s = Solution();
print(s.scheduleCourse([[7,16],[2,3],[3,12],[3,14],[10,19],[10,16],[6,8],[6,11],[3,13],[6,16]]))
