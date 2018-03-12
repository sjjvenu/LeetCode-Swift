class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else {
            return 0;
        }
        var dp = [Int].init(repeating:0,count:n+1);
        for i in 1...n {
            if i == 1 || i == 2 {
                dp[i] = i;
            }
            else {
                dp[i] = dp[i-1] + dp[i-2];
            }
        }
        return dp[n];
    }
}
