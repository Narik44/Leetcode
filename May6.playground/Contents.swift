import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        if(nums.count == 1) {return nums[0]}
        for i in nums {
            if dict[i] != nil {
                dict[i] = dict[i]! + 1
                if dict[i]! > nums.count/2 {return i}
            } else {
                dict[i] = 1
            }
        }
       return -1
    }
}


let sol =  Solution()
print(sol.majorityElement([1]))
