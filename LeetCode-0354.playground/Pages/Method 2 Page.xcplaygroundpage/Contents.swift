//: [Previous](@previous)

/*:
 # 贪心 + 二分查找
 
 同前一方法，先排序，然后再用贪心 + 二分查找，具体见题「300. 最长递增子序列」。
 */

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        if envelopes.count == 0 {
            return 0
        }
        var envelopesSorted: [[Int]] = envelopes.sorted(by: {(item1: [Int], item2: [Int]) -> Bool in
            return item1[0] == item2[0] ? item1[1] > item2[1] : item1[0] < item2[0]
        })
        var d: [Int] = [Int]()
        for item in envelopesSorted {
            if item[1] > d.last ?? Int.min {
                d.append(item[1])
            } else {
                var left = 0
                var right = d.count - 1
                var loc = right
                while left <= right {
                    let mid = (left + right) / 2
                    if item[1] <= d[mid] {
                        loc = mid
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
                d[loc] = item[1]
            }
        }
        return d.count
    }
}
