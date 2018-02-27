

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

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

 
/*
 
 */
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard intervals.count > 0 else {
            return [];
        }
        //按照start值排序
        var sortList = intervals.sorted { (value1,value2) -> Bool in
            return value1.start < value2.start;
        }
        //当前节点与下一节点合并，合并后的结果保存到下一节点，并移除当前节点，直到遍历数组完成
        var curIndex = sortList.startIndex;
        while curIndex != sortList.endIndex {
            let curValue = sortList[curIndex];
            if curValue.start > curValue.end {
                curIndex = sortList.index(curIndex,offsetBy:1);
                continue;
            }
            let nextIndex = sortList.index(curIndex,offsetBy:1)
            if  nextIndex != sortList.endIndex {
                let nextValue = sortList[nextIndex];
                var newElement:Interval? = nil;
                if curValue.end >= nextValue.start && curValue.end <= nextValue.end {
                    newElement = Interval(curValue.start,nextValue.end);
                }
                else if curValue.start <= nextValue.start && curValue.end >= nextValue.end {
                    newElement = Interval(curValue.start,curValue.end);
                }
                else if curValue.start >= nextValue.start && curValue.end <= nextValue.end {
                    newElement = Interval(nextValue.start,nextValue.end);
                }
                if newElement != nil {
                    sortList[nextIndex] = newElement!;
                    sortList.remove(at:curIndex);
                    continue;
                }
            }
            curIndex = sortList.index(curIndex,offsetBy:1);
        }
        return sortList;
    }
}

let i1 = Interval(1,6);let i2 = Interval(2,9);let i3 = Interval(8,10);let i4 = Interval(15,18);
var intervals = [Interval]();
intervals.append(i1);
intervals.append(i2);
intervals.append(i3);
intervals.append(i4);
let s = Solution();
s.merge(intervals);
