
/*
 a ^ a = 0;
 a ^ 0 = a;
 a ^ b ^ a = (a ^ a ) ^ b = 0 ^ b = b;
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0;
        for n in nums {
            a ^= n;
        }
        return a;
    }
}
