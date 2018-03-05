class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0;
        }
        var dp = [Int].init(repeating:0,count:prices.count);
        var min = prices.first!;
        for i in 1..<prices.count {
            let indexI = prices.index(prices.startIndex,offsetBy:i);
            dp[i] = max(dp[i-1],prices[indexI]-min);
            if min > prices[indexI] {
                min = prices[indexI];
            }
        }
        return dp[prices.count-1];
    }
}
