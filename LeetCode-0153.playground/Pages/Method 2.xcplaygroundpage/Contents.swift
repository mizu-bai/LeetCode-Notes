//: [Previous](@previous)

//: # 方法二：方法一的简化

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0
        var right = n - 1
        while left < right {
            let mid = (left + right) / 2
            if nums[mid] < nums[right] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return nums[left]
    }
}

//: [Next](@next)
