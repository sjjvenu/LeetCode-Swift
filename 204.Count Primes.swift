class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 0;
        }
        var count = 0;
        var notPrime = [Bool].init(repeating:false,count:n);
        for i in 2..<n {
            if notPrime[i] == false {
                count += 1;
                var j = 2;
                while i*j < n {
                    notPrime[i*j] = true;
                    j += 1;
                }
            }
        }
        return count;
    }
    
    func countPrimes2(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 0;
        }
        var count = 0;
        for i in 2..<n {
            if isPrimeNum(i) {
                count += 1;
            }
        }
        return count;
    }
    
    func isPrimeNum(_ n:Int) -> Bool {
        if n == 2 || n == 3 {
            return true;
        }
        let count = Int(sqrt(Double(n)));
        for i in 2...count {
            if n%i == 0 {
                return false;
            }
        }
        return true;
    }
}
