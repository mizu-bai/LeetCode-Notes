//: [Previous](@previous)

/*:
 # 哈希表
 
 用 `dict` 硬编码，遍历字符串将其转换为各个字符的值的数组。遍历数组，若当前的数大于后面一位数，则减去，反之加上。
 */

class Solution {
    func romanToInt(_ s: String) -> Int {
        let dict: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var nums: [Int] = [Int]()
        for (index, char) in s.enumerated() {
            nums.append(dict[char]!)
        }
        var result = nums[nums.count - 1]
        for i in 0 ..< nums.count - 1 {
            if nums[i] < nums[i + 1] {
                result -= nums[i]
            } else {
                result += nums[i]
            }
        }
        return result
    }
}

//: [Next](@next)
