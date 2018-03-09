class Solution {
    func isHappy(_ n: Int) -> Bool {
        if n == 0 {
            return false;
        }
        var loop = [Int]();
        loop.append(n);
        var sum = getNumsSum(n);
        while sum != 1 {
            if loop.contains(sum) {
                return false;
            }
            loop.append(sum);
            sum = getNumsSum(sum);
        }
        return true;
    }
    
    func getNumsSum(_ n:Int) -> Int {
        var num = n;
        var sum = 0;
        while num/10 > 0 {
            sum += (num%10)*(num%10);
            num = num/10;
        }
        sum += (num%10)*(num%10);
        return sum;
    }
}
