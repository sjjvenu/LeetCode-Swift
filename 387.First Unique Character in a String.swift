class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else {
            return -1;
        }
        
        var dic = [Character:Int]();
        for i in 0..<s.count {
            let c = s[s.index(s.startIndex,offsetBy:i)];
            if dic[c] != nil {
                dic[c]! = -1;
            }
            else {
                dic[c] = i;
            }
        }
        var minIndex = s.count;
        for obj in dic {
            if obj.value >= 0 {
                if minIndex > obj.value {
                    minIndex = obj.value;
                }
            }
        }
        if minIndex < s.count {
            return minIndex;
        }
        return -1;
    }
}
