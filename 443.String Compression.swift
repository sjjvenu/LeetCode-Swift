

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

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

 
/*
 
 */
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 0 else {
            return 0;
        }
        if chars.count == 1 {
            return 1;
        }
        var modifyChars = [Character]();
        var lastC:Character?;
        var count = 0;
        for index in 0..<chars.count {
            let c = chars[chars.index(chars.startIndex, offsetBy: index)];
            if lastC == c {
                count += 1;
                if count > 0 && index == chars.count - 1{
                    modifyChars += getNumString(count+1);
                }
            }
            else {
                if count == 0 {
                }
                else if count > 0 {
                    modifyChars += getNumString(count+1);
                }
                modifyChars.append(c);
                lastC = c;
                count = 0;
            }
        }
        chars = modifyChars;
        return modifyChars.count;
    }
    
    func getNumString(_ num:Int) -> [Character] {
        let s = String(num);
        var result = [Character]();
        for c in s {
            result.append(c);
        }
        return result;
    }
}

let s = Solution();
var chars:[Character] = ["a","a","b","b","c","c","c"];
print(s.compress(&chars))

