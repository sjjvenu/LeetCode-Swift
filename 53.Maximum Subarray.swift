class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return Int(Int32.min);
        }
        var maxSum = nums.first!;
        var dp = [Int].init(repeating:0,count:nums.count);
        dp[0] = nums.first!;
        for i in 1..<nums.count {
            let index = nums.index(nums.startIndex,offsetBy:i);
            dp[i] = nums[index] + (dp[i-1] > 0 ? dp[i-1] : 0);
            maxSum = max(dp[i],maxSum);
        }
        return maxSum;
    }
}
