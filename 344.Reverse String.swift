


class Solution {
    func reverseString(_ s: String) -> String {
        var reStr = "";
        for str in s {
            reStr.insert(str,at:reStr.startIndex);
        }
        return reStr;
    }
}
