class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0;
        }
        for i in 0..<nums.count {
            let index = nums.index(nums.startIndex,offsetBy:i);
            if nums[index] < target {
                continue;
            }
            else if nums[index] == target {
                return i;
            }
            else {
                if i == 0 {
                    return 0;
                }
                else {
                    return i;
                }
            }
        }
        return nums.count;
    }
}
