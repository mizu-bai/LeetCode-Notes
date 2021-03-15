//: [Previous](@previous)

/*:
 # 可变拉链数组
 
 拉链会根据分桶中的 key 动态增长，更类似于真正的链表。分桶数使用质数，可以减少 hash 值冲突。
 */

class MyHashSet {

    var buckets: Int
    var table: [[Int]]

    /** Initialize your data structure here. */
    init() {
        self.buckets = 1009
        self.table = [[Int]](repeating: [Int](), count: self.buckets)
    }

    func hash(_ key: Int) -> Int {
        return key % self.buckets
    }

    func add(_ key: Int) {
        let hashKey = self.hash(key)
        if !self.table[hashKey].contains(key) {
            self.table[hashKey].append(key)
        }
    }
    
    func remove(_ key: Int) {
        let hashKey = self.hash(key)
        self.table[hashKey].removeAll(where: {$0 == key})
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hashKey = self.hash(key)
        return self.table[hashKey].contains(key)
    }
}
