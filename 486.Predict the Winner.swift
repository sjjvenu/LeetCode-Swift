
import Foundation

//递归方法，效率低
class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        
        return helper(nums: nums, start: 0, end: nums.count - 1) >= 0;
    }
    
    //利用两者相减的差值是否>=0来判断谁是赢家。问题可以拆分为:如果player1选择了start，则player2可选择start+1或者end；如果player1选择了end，则player2可选择。然后找到两者中的最大值，如此递归下去，即可找到最后的结果。
    func helper(nums:[Int],start:Int,end:Int) -> Int {
        if (start == end)
        {
            return nums[start];
        }
        return max(nums[start] - helper(nums: nums, start: start+1, end: end), nums[end] - helper(nums: nums, start: start, end: end-1));
    }
}
//根据递推表达式，max(nums[start] - helper(nums: nums, start: start+1, end: end), nums[end] - helper(nums: nums, start: start, end: end-1))。用n表示nums的count,方法二从n-2和n-1逆序开始，求出n-2和n-1的最大差值（先是两个数，然后是三个、四个。后面的值需要用前面的值来计算，如此重复下去即可），然后按照表达式既然运行，直到找到dp[0][n-1]（因为这个值是从0到n-1完整的nums）
class Solution2 {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        let row = [Int].init(repeating: 0, count: nums.count);
        var dp = [[Int]].init(repeating: row, count: nums.count);
        for start in (0 ..< nums.count-1).reversed()
        {
            for end in start+1 ..< nums.count
            {
                let a = nums[start] - dp[start+1][end];
                let b = nums[end] - dp[start][end-1];
                dp[start][end] = max(a, b);
            }
        }
        return dp[0][nums.count-1] >= 0;
    }
    
}


let sol = Solution2();
let nums = [1,5,233,7];
print(sol.PredictTheWinner(nums));
