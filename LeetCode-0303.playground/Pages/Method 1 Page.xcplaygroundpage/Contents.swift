//: [Previous](@previous)

/*:
 # 暴力法
 
 创建一个变量保存 `nums` 的值，每次调用 `sumRange` 方法时，循环累加计算。
 
 时间复杂度：`O(n)`
 
 其中，`n` 是数组  `nums` 的长度
 */

class NumArray {
    /// 暴力法
    var nums: [Int] = [Int]()
    init(_ nums: [Int]) {
        self.nums = nums
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        var sum: Int = 0
        for k in i ... j {
            sum += nums[k]
        }
        return sum
    }
}

//: [Next](@next)
