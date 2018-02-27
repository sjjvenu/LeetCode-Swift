
/*
 统计一个数组中元素出现个数，再遍历另一个数组，发现有的加入结果集中
 */
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic = [Int:Int]();
        for i in nums1 {
            if dic[i] != nil {
                dic[i]! += 1;
            }
            else {
                dic[i] = 1;
            }
        }
        var result = Set<Int>();
        for i in nums2 {
            if let count = dic[i],count > 0 {
                result.insert(i);
            }
        }
        return Array(result);
    }
}
