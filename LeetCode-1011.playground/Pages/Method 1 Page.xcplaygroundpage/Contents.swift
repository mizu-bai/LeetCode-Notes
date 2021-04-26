//: [Previous](@previous)

/*:
 # 方法一：二分
    
 ## 思路
 
 考虑每天的运载量：
 
 * 若花费最长的时间运输，则此时的运载量 `weightMin` 是 `weights` 中的最大值
 * 若花费最短的时间运输，则此时的运载量 `weightMax` 是 `weights` 之和
 
 因此，满足条件的  `weight` 应在这两个值之间，可以使用二分查找。
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n * log(sum(weights)))`，其中 `n` 是 `weights` 的长度å
 * 空间复杂度：`O(1)`
 
 */

class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var weightMax = weights.reduce(0, {$0 + $1})
        var weightMin = weights.max()!
        while weightMin < weightMax {
            let weightMid = (weightMax + weightMin) / 2
            if minTime(weights, weightMid) <= D {
                weightMax = weightMid
            } else {
                weightMin = weightMid + 1
            }
        }
        return weightMin
    }
    func minTime(_ weights: [Int], _ weightMin: Int) -> Int {
        var count = 0
        var curWeight = 0
        for weight in weights {
            if curWeight + weight > weightMin {
                count += 1
                curWeight = 0
            }
            curWeight += weight
        }
        return count + 1
    }
}

//: [Next](@next)
