
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
 解题思路：入栈出栈的操作
 如果是数字，则保存起来，等到紧跟着的【】内的内容计算，计算完成后则把数字栈清空
 如果字母，把结果保存起来，注意只有没有【】时才会保存这个结果，计算完成后结果也清空
 如果遇到【】，则一层层的解码里面的内容，直到最后只剩下纯字母也就可以返回结果
 */
class Solution {
    func decodeString(_ s: String) -> String {
        guard s.count > 0 else {
            return "";
        }
        var resultString = "";
        var numString = "";
        var children = "";
        var count = 0;
        for element in s {
            if element == "[" {
                count += 1;
                if count > 1 {
                    children.append(element);
                }
            }
            else if element == "]" {
                count -= 1;
                if count > 0 {
                    children.append(element);
                }
                if count == 0 {
                    if let num = Int(String(numString)),num > 0{
                        resultString.append(String.init(repeating: decodeString(children), count: num))
                    }
                    else {
                        resultString.append(decodeString(children));
                    }
                    numString = "";
                    children = "";
                }
            }
            else {
                if let num = Int(String(element)),num >= 0,count == 0{
                    numString.append(element);
                }
                else {
                    if (count > 0) {
                        children.append(element);
                    }
                    else {
                        resultString.append(element);
                    }
                }
            }
        }
        
        
        return resultString;
    }
}

let s = Solution();
print(s.decodeString("a100[leetcode]"))
