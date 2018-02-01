
import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    //记录二叉树层数
    var row = 0;
    func printTree(_ root: TreeNode?) -> [[String]] {
        guard let root = root else {
            return [];
        }
        
        let s = travel2String(root,"",0);
        let sArray = s.split(separator: ",")
        guard sArray.count > 0 else {
            return [];
        }
        
        let columnCount = Int(pow(Double(2), Double(self.row+1)))-1;
        let rowValue = Array.init(repeating: "", count: columnCount);
        var retValue = Array.init(repeating: rowValue, count: self.row+1);
        for element in sArray {
            let indexs = getRowAndColumn(str: String(element));
            if (indexs.count == 3) {
                retValue[indexs[0]][indexs[1]] = String(indexs[2]);
            }
        }
        return retValue;
    }
    
    //遍历二叉树，如果树在左边，加一个L，右边则加R
    func travel2String(_ root: TreeNode?,_ flag: String,_ rowIndex: Int) -> String {
        guard let root = root else {
            return "";
        }
        if (rowIndex > self.row)
        {
            self.row = rowIndex;
        }
        return travel2String(root.left,"L"+flag,rowIndex+1) + flag + ":" + String(describing: root.val) + "," + travel2String(root.right,"R"+flag,rowIndex+1);
    }
    
    //根据求取的字符串来计算位置,一个L就是左边的中间，一个R就是右边的中间值，如此循环下去即可计算出具体位置
    func getRowAndColumn(str:String) -> [Int] {
        guard str.count > 0 else {
            return [];
        }
        let array = str.split(separator: ":");
        var retValue = [Int]();
        let columnCount = Int(pow(Double(2), Double(self.row+1)))-1;
        var middle:Int = columnCount/2;
        if array.count == 2 {
            let rowS = array[0];
            retValue.append(rowS.count);
            for s in rowS {
                if s == "L" {
                    middle = (0 + middle)/2;
                }
                else
                {
                    middle = (middle + columnCount)/2;
                }
            }
            retValue.append(middle);
            retValue.append(Int(array[1])!)
        }
        else if (array.count == 1)
        {
            retValue.append(0);
            retValue.append(middle);
            retValue.append(Int(array[0])!);
        }
        else
        {
            return [];
        }
        return retValue;
    }
}


let sol = Solution();
let root = TreeNode(1),l1 = TreeNode(2),l2 = TreeNode(3),l3 = TreeNode(4),r1 = TreeNode(5);
//root.left = l1;root.right = r1;l1.left = l2;l2.left = l3;

let result = sol.printTree(root);
print(result);
