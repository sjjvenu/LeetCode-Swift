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
    //利用数组将指针存储起来，然后逆序访问数组，构造一个反向链表，时间复杂度o(2n),空间复杂度o(1)
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head = head else {
            return nil
        }
        var revList:ListNode? = nil;
        var listArray = [ListNode]();
        var p = head;
        while p != nil {
            listArray.append(p!);
            p = p?.next;
        }
        
        var q:ListNode? = nil;
        for index in (0..<listArray.count).reversed()
        {
            q = listArray[index];
            if (index == listArray.count-1)
            {
                revList = q;
            }
            if (index > 0)
            {
                q?.next = listArray[index-1];
            }
            else
            {
                q?.next = nil;
            }
        }
        
        return revList;
    }
    //首先用一个临时变量保存下一个结点位置，当前点的next指向前一个结点，前一结点=当前结点，然后当前结点指向下一结点位置，如此循环下去即可。时间复杂度o(n),空间复杂度o(1)
    func reverseList2(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil, curr = head
        while curr != nil
        {
            let listTemp = curr?.next;
            curr?.next = pre;
            pre = curr;
            curr = listTemp;
        }
        return pre
    }
}

let sol = Solution();

let x1 = ListNode(1),x2 = ListNode(2),x3 = ListNode(3)
x1.next = x2;x2.next = x3

sol.reverseList(x1)

