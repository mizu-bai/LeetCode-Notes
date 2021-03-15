//: [Previous](@previous)

/*:
 # 不可变拉链数组
 
 把 HashSet 设计成一个 `M * N` 的二维数组。第一个维度（由 `hash()` 函数计算）用于分桶，第二个维度（由 `ops()` 函数计算） 用于确定 `key` 存放的具体位置。
 */

class MyHashSet {
    var buckets: Int
    var itemsPerBucket: Int
    var table: [[Int]]
    /** Initialize your data structure here. */
    init() {
        self.buckets = 1000
        self.itemsPerBucket = 1001
        self.table = [[Int]](repeating: [Int](), count: self.buckets)
    }
    
    func hash(_ key: Int) -> Int {
        return key % self.buckets
    }

    func pos(_ key: Int) -> Int {
        return key / self.buckets
    }

    func add(_ key: Int) {
        let hashKey = self.hash(key)
        if self.table[hashKey] == [Int]() {
            self.table[hashKey] = [Int](repeating: 0, count: self.itemsPerBucket)
        }
        self.table[hashKey][self.pos(key)] = 1
    }
    
    func remove(_ key: Int) {
        let hashKey = self.hash(key)
        if self.table[hashKey] != [Int]() {
            self.table[hashKey][self.pos(key)] = 0
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hashKey = self.hash(key)
        if self.table[hashKey] != [Int]() && self.table[hashKey][self.pos(key)] == 1 {
            return true
        } else {
            return false
        }
    }
}

//: [Next](@next)

