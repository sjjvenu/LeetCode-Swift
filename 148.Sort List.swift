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
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head;
        }
        var slow:ListNode? = head;
        var fast:ListNode? = head?.next;
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        fast = slow?.next;
        slow?.next = nil;
        return mergeList(sortList(head),sortList(fast));
    }
    
    func mergeList(_ list1:ListNode?,_ list2:ListNode?) -> ListNode? {
        let header = ListNode(0);
        var cur:ListNode? = header;
        var l1 = list1;
        var l2 = list2;
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur!.next = l1;
                l1 = l1!.next;
            }
            else {
                cur!.next = l2;
                l2 = l2!.next;
            }
            cur = cur!.next;
        }
        if l1 != nil {
            cur!.next = l1;
        }
        if l2 != nil {
            cur!.next = l2;
        }
        return header.next;
    }
}
