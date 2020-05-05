import Foundation

//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict: [Character:Int] = [:]
        for (index,char) in s.enumerated() {
            if dict[char] == nil {
                dict[char] = index
            } else{
                dict[char] = -1
            }
        }
        
        var index = Int.max
        for (_,element) in dict.values.enumerated() {
            if element != -1 , element < index {
                index = element
            }
        }
        return index == Int.max ? -1 : index
    }
}


let sol = Solution()
sol.firstUniqChar("heher")
