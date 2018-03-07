class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        guard S.count > 0 else {
            return [""];
        }
        var result = [String]();
        var letterCount = 0;
        for element in S {
            if isALetter(String(element)) {
                letterCount += 1;
            }
        }
        for i in 0..<1<<letterCount {
            var j = 0;
            var word = "";
            for element in S {
                if isALetter(String(element)) {
                    if ((i>>j) & 1) == 1 {
                        word.append(String(element).lowercased());
                    }
                    else {
                        word.append(String(element).uppercased());
                    }
                    j += 1;
                }
                else {
                    word.append(element);
                }
            }
            result.append(word);
        }
        return result;
    }
    
    func isALetter(_ s:String) -> Bool {
        if let charFirst = s.utf8.first {
            if (charFirst > 64 && charFirst < 91) || (charFirst > 96 && charFirst < 123) {
                return true;
            }
        }
        return false;
    }
}
