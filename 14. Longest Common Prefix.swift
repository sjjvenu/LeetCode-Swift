

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return "";
        }
        if strs.count == 1 {
            return strs[strs.startIndex];
        }
        else if strs.count == 2 {
            var commonStr = "";
            let s1 = strs[strs.startIndex];
            let s2 = strs[strs.index(strs.startIndex,offsetBy:1)];
            let minCount = min(s1.count,s2.count);
            for i in 0..<minCount {
                if s1[s1.index(s1.startIndex,offsetBy:i)] == s2[s2.index(s2.startIndex,offsetBy:i)] {
                    commonStr += String(s1[s1.index(s1.startIndex,offsetBy:i)]);
                }
                else {
                    break;
                }
            }
            return commonStr;
        }
        else {
            let middle:Int = (strs.count + 1)/2;
            var newStr = [String]();
            newStr.append(longestCommonPrefix(Array(strs[strs.startIndex..<strs.index(strs.startIndex,offsetBy:middle)])));
            newStr.append(longestCommonPrefix(Array(strs[strs.index(strs.startIndex,offsetBy:middle)..<strs.endIndex])));
            return longestCommonPrefix(newStr);
        }
    }
}
