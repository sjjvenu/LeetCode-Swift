class Solution {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p.count == 0 {
            return s.count == 0;
        }
        var firstMatch = false;
        if s.count > 0 && (s.first == p.first || p.first == ".") {
            firstMatch = true;
        }
        if p.count >= 2 && p[p.index(p.startIndex,offsetBy:1)] == "*" {
            return (firstMatch && isMatch(String(s[s.index(s.startIndex,offsetBy:1)..<s.endIndex]),p)) || isMatch(s,String(p[p.index(p.startIndex,offsetBy:2)..<p.endIndex]));
        }
        else {
            return firstMatch && isMatch(String(s[s.index(s.startIndex,offsetBy:1)..<s.endIndex]),String(p[p.index(p.startIndex,offsetBy:1)..<p.endIndex]));
        }
    }
    
    func isMatch2(_ s: String, _ p: String) -> Bool {
        var dp = [[Bool]].init(repeating:[Bool].init(repeating:false,count:p.count+1),count:s.count+1);
        dp[0][0] = true;
        for i in 0...s.count {
            for j in 0...p.count {
                if j > 0 {
                    let indexJ = p.index(p.startIndex,offsetBy:j-1);
                    if p[indexJ] == "*" {
                        dp[i][j] = dp[i][j-2] || (i > 0 && (s[s.index(s.startIndex,offsetBy:i-1)] == p[p.index(p.startIndex,offsetBy:j-2)] || p[p.index(p.startIndex,offsetBy:j-2)] == ".") && dp[i-1][j]);
                    }
                    else {
                        dp[i][j] = i > 0 && dp[i-1][j-1] && (i > 0 && s[s.index(s.startIndex,offsetBy:i-1)] == p[p.index(p.startIndex,offsetBy:j-1)] || p[p.index(p.startIndex,offsetBy:j-1)] == ".");
                    }
                }
            }
        }
        return dp[s.count][p.count];
    }
    
}
