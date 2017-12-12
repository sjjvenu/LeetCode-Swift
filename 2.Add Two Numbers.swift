//
//  main.swift
//  testSwitCommandLineTool
//
//  Created by tdx on 2017/12/12.
//  Copyright © 2017年 tdx. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var p1 = l1;
        var p2 = l2;
        
        let header = ListNode.init(0);
        header.next = ListNode.init(0);
        var nextList = header.next;
        
        //每位相加，直到所有值为nil
        var bAdd = false;
        while (p1 != nil || p2 != nil)
        {
            if (p1 != nil)
            {
                nextList!.val += p1!.val;
                p1 = p1?.next;
            }
            
            if (p2 != nil)
            {
                nextList!.val += p2!.val;
                p2 = p2?.next;
            }
            
            //如果>=10则需要进1位
            if (nextList!.val >= 10)
            {
                bAdd = true;
                nextList!.val = nextList!.val%10;
            }
            
            //如果有进位，即使p1和p1都是nil，也需要再new一个节点出来
            if (p1 != nil || p2 != nil || bAdd)
            {
                nextList?.next = ListNode.init(0);
                nextList = nextList?.next;
                if (bAdd)
                {
                    nextList?.val += 1;
                    bAdd = false;
                }
            }
        }
        
        return header.next;
    }
}

let sol = Solution();
let m1 = ListNode(2),m2 = ListNode(4),m3 = ListNode(3),n1 = ListNode(5),n2 = ListNode(6),n3 = ListNode(4)
m1.next = m2;m2.next = m3;n1.next = n2;n2.next = n3;
let x1 = ListNode(9),x2 = ListNode(9),y1 = ListNode(1)
x1.next = x2
let result = sol.addTwoNumbers(y1, x1)

//let result = sol.search2([4,5,6,7,0,1], 5);
//
//print(result);

