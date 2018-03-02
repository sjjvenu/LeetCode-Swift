


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = nums.startIndex;
        while index != nums.endIndex {
            let nextIndex = nums.index(index,offsetBy:1);
            if nextIndex != nums.endIndex {
                if nums[index] == nums[nextIndex] {
                    nums.remove(at:index);
                    continue;
                }
            }
            index = nextIndex;
        }
        return nums.count;
    }
}
