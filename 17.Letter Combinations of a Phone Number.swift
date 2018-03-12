class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [];
        }
        if digits.contains("1") || digits.contains("*") || digits.contains("0") || digits.contains("#") {
            return [];
        }
        var array1 = getLetters(String(digits.first!));
        if digits.count == 1 {
            return array1;
        }
        var ans = [String]();
        var subString = digits;
        subString.removeFirst();
        var array2 = letterCombinations(subString);
        for str1 in array1 {
            for str2 in array2 {
                ans.append(str1+str2);
            }
        }
        return ans;
    }
    
    func getLetters(_ digit: String) -> [String] {
        guard digit.count == 1 else {
            return [];
        }
        switch digit {
        case "2":
            return ["a","b","c"];
        case "3":
            return ["d","e","f"];
        case "4":
            return ["g","h","i"];
        case "5":
            return ["j","k","l"];
        case "6":
            return ["m","n","o"];
        case "7":
            return ["p","q","r","s"];
        case "8":
            return ["t","u","v"];
        case "9":
            return ["w","x","y","z"];
        default:
            return [];
        }
        
        return [];
    }
}
