//: [Previous](@previous)

/*:
 # 集合（1）
 
 使用集合存储数字。遍历数组中的每个数字，如果集合中没有该数字，则将该数字加入集合，如果集合中已经有该数字，则将该数字从集合中删除，最后剩下的数字就是只出现一次的数字
 
 时间复杂度：`O(n)`
 
 空间复杂度：`O(n)`
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var tmp = Set<Int>()
        for item in nums {
            if tmp.contains(item) {
                tmp.remove(item)
            } else {
                tmp.insert(item)
            }
        }
        return tmp.first!
    }
}

//: [Next](@next)
