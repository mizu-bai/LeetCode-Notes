//: [Previous](@previous)

/*:
 # 不可变链表
 
 用一个 `M * N` 的二维数组保存 `value`，数组的第一个索引为 `hash(key)`，数组的第二个索引为 `pos(key)`。
 */

class MyHashMap {

    var buckets: Int
    var itemForBuckets: Int
    var table: [[Int]]

    /** Initialize your data structure here. */
    init() {
        self.buckets = 1009
        self.itemForBuckets = 1009
        self.table = [[Int]](repeating: [Int](repeating: -1, count: self.itemForBuckets), count: buckets)
    }
    
    func hash(_ key: Int) -> Int {
        return key % self.buckets
    }

    func pos(_ key: Int) -> Int {
        return key / self.itemForBuckets
    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        self.table[self.hash(key)][self.pos(key)] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return self.table[self.hash(key)][self.pos(key)]
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        self.table[self.hash(key)][self.pos(key)] = -1
    }
}

//: [Next](@next)
