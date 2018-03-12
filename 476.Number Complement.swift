

class Solution {
    func findComplement(_ num: Int) -> Int {
        var count = 0;
        var sum = 0;
        while sum < num {
            sum += Int(pow(Double(2),Double(count)));
            count += 1;
        }
        return num ^ sum;
    }
}
