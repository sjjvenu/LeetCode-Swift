
/*
 统计string第个元素出现的个数
 */
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false;
        }
        return getCount(s) == getCount(t);
    }
    
    func getCount(_ s: String) ->[Character:Int] {
        guard s.count > 0 else {
            return [:];
        }
        var dic = [Character:Int]();
        for c in s {
            if dic[c] != nil {
                dic[c]! += 1;
            }
            else {
                dic[c] = 1;
            }
        }
        return dic;
    }
}
