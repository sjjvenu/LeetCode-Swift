//
//  main.swift
//  testSwitCommandLineTool
//
//  Created by tdx on 2017/12/12.
//  Copyright © 2017年 tdx. All rights reserved.
//

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1;
        }
        //用二分法查找旋转点，即最小值所在索引
        var realLow = 0;
        var low = 0,high = nums.count-1,middle = (Int)(low+high)/2;
        while low < high {
            if (nums[middle] > nums[high])
            {
                low = middle+1;
                middle = (Int)(low + high)/2;
            }
            else
            {
                high = middle;
                middle = (Int)(low + high)/2;
            }
        }
        realLow = low;
        
        low = 0;
        high = nums.count-1;
        var realMiddle = middle;
        //继续用二方法查找target
        while low <= high {
            middle = (Int)(low+high)/2;
            //计算真正的middle值
            realMiddle = (middle+realLow)%nums.count;
            if (nums[realMiddle] < target)
            {
                low = middle+1;
            }
            else if (nums[realMiddle] > target)
            {
                high = middle-1;
            }
            else
            {
                return realMiddle;
            }
            
        }
        
        return -1;
    }
    
    //效率比较低的版本，用系统sort函数
    func search2(_ nums: [Int], _ target: Int) -> Int {
        if (nums.count == 0)
        {
            return -1;
        }
        
        let findIndex = nums.index { (find) -> Bool in
            return find == target
        }
        if (findIndex != nil) {
            return findIndex!
        }
        return -1;
    }
}

let sol = Solution();
let result = sol.search([4,5,6,7,0,1], 7);

print(result);
