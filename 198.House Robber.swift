class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0;
        }
        if nums.count == 1 {
            return nums.first!;
        }
        if nums.count == 2 {
            return max(nums.first!,nums[1]);
        }
        var sum = 0;
        var dp = [Int].init(repeating:0,count:nums.count);
        dp[0] = nums.first!;
        dp[1] = max(nums.first!,nums[1]);
        for i in 2..<nums.count {
            dp[i] = max(dp[i-1],dp[i-2] + nums[i]);
        }
        return dp[nums.count-1];
    }
}
