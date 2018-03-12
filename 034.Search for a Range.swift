class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else {
            return [-1,-1];
        }
        if nums.first! > target {
            return [-1,-1];
        }
        var temp = [Int]();
        for i in 0..<nums.count {
            let index = nums.index(nums.startIndex,offsetBy:i);
            if nums[index] == target {
                temp.append(i);
            }
        }
        var ans = [Int]();
        if temp.count == 0 {
            return [-1,-1];
        }
        else if temp.count == 1 {
            ans.append(temp.first!);
            ans.append(temp.first!);
        }
        else {
            ans.append(temp.first!);
            ans.append(temp.last!);
        }
        return ans;
    }
}
