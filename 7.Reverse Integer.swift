class Solution {
    func reverse(_ x: Int) -> Int {
        if x >= 0 {
            let s = String(x);
            let sRe = String(s.reversed());
            return Int(sRe) ?? 0 <= Int32.max ? Int(sRe) ?? 0 : 0;
        }
        else {
            let s = String(-x);
            let sRe = String(s.reversed());
            return 0-(Int(sRe) ?? 0) >= Int32.min ? 0-(Int(sRe) ?? 0) : 0;
        }
    }
}
