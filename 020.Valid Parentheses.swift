class Solution {
    
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else {
            return false;
        }
        var stack = "";
        
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                stack.insert(c,at:stack.startIndex);
            }
            else {
                if let first = stack.first,canRemove(first,c) {
                    stack.removeFirst();
                    continue;
                }
                else {
                    return false;
                }
            }
        }
        return stack.count == 0;
    }
    
    func canRemove(_ c1:Character,_ c2:Character) -> Bool {
        if c1 == "(" && c2 == ")" || c1 == "{" && c2 == "}" || c1 == "[" && c2 == "]"{
            return true;
        }
        return false;
    }
}
