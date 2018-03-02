//c plus plus accepted while siwft time limit exceeded

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0;
        }
        if haystack == needle {
            return 0;
        }
        if haystack.count < needle.count {
            return -1;
        }
        for i in 0..<haystack.count {
            let index = haystack.index(haystack.startIndex,offsetBy:i);
            if haystack[index] == needle[needle.startIndex] {
                if i+needle.count <= haystack.count {
                    if haystack[index..<haystack.index(index,offsetBy:needle.count)] == needle {
                        return i;
                    }
                }
            }
        }
        return -1;
    }
}
