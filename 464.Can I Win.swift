
import Foundation

class Solution {
    var m = [Int].init(repeating: 0, count: 1 << 20);
    
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        let sum = maxChoosableInteger*(maxChoosableInteger + 1)/2;
        if desiredTotal < 2 {
            return true;
        }
        if sum < desiredTotal {
            return false;
        }
        if sum == desiredTotal && maxChoosableInteger%2 != 0 {
            return true;
        }
        return dfs(maxChoosableInteger, desiredTotal, 0);
    }
    
    func dfs(_ M:Int,_ T:Int,_ visited:Int) -> Bool {
        if (T <= 0 || m[visited] > 0) {
            return (T>0) && (m[visited]>0);
        }
        for i in 0..<M {
            let mask = 1<<i;
            if ( (mask&visited <= 0) && (dfs(M, T-i-1, mask|visited) == false)) {
                m[visited]=1;
                return true;
            }
        }
        m[visited] = -1;
        return false;
    }
}

let sol2 = Solution();
print(sol2.canIWin(20, 210))

let s = 1 << 20;
print(s);
