class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic1 = getCount(nums1);
        var dic2 = getCount(nums2);
        var result = [Int]();
        for obj in dic1 {
            if dic2[obj.key] != nil {
                let minCount = min(dic2[obj.key]!,obj.value);
                for i in 0..<minCount {
                    result.append(obj.key);
                }
            }
        }
        return result;
    }
    func getCount(_ nums:[Int]) -> [Int:Int] {
        var dic = [Int:Int]();
        for i in nums {
            if dic[i] != nil {
                dic[i]! += 1;
            }
            else {
                dic[i] = 1;
            }
        }
        return dic;
    }
}
