//: [Previous](@previous)

/*:
 # 可变长度链表
 
 链表会随着 `key` 动态增长，分桶数取质数，更分散。
 */

class MyHashMap {

    var buckets: Int
    var table: [[[Int]]]

    /** Initialize your data structure here. */
    init() {
        self.buckets = 1009
        self.table = [[[Int]]](repeating: [[Int]](), count: buckets)
    }
    
    func hash(_ key: Int) -> Int {
        return key % self.buckets
    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let hashKey = self.hash(key)
        for item in self.table[hashKey] {
            if item[0] == key {
                self.table[hashKey].removeAll(where: {$0[0] == key})
                self.table[hashKey].append([key, value])
            }
        }
        self.table[hashKey].append([key, value])
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let hashKey = self.hash(key)
        for item in self.table[hashKey] {
            if item[0] == key {
                return item[1]
            }
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let hashKey = self.hash(key)
        self.table[hashKey].removeAll(where: {$0[0] == key})
    }
}
