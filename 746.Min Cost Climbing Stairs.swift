class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var f1 = 0;
        var f2 = 0;
        for num in cost.reversed() {
            let f0 = num + min(f1,f2);
            f2 = f1;
            f1 = f0;
        }
        
        return min(f1,f2);
    }
}
