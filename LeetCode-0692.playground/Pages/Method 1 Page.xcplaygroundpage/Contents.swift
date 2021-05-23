//: [Previous](@previous)

/*:
 # 方法一：哈希表 + 排序
 
 ## 思路
 
 先用哈希表统计各单词出现次数，再先按 `value` 升序，再按 `key`字典序排序。
 
 ## 复杂度分析
 
 * 时间：`O(l * n + l * m * log(m))`
 * 空间：`O(l * m)`
 */

class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dict = [String: Int]()
        for word in words {
            dict[word] = (dict[word] ?? 0)! + 1
        }
        let array = dict.keys.sorted(by: {(key1: String, key2: String) -> Bool in
            if dict[key1]! != dict[key2]! {
                return dict[key1]! > dict[key2]!
            }
            return key1 < key2
        })
        return array[0 ..< k] + [String]()
    }
}

//: [Next](@next)
