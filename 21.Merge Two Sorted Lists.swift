/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0);
        var list1 = l1;
        var list2 = l2;
        var helper:ListNode? = head;
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                helper?.next = list1;
                list1 = list1?.next;
                helper = helper?.next;
            }
            else {
                helper?.next = list2;
                list2 = list2?.next;
                helper = helper?.next;
            }
        }
        while list1 != nil {
            helper?.next = list1;
            list1 = list1?.next;
            helper = helper?.next;
        }
        while list2 != nil {
            helper?.next = list2;
            list2 = list2?.next;
            helper = helper?.next;
        }
        return head.next;
    }
}
