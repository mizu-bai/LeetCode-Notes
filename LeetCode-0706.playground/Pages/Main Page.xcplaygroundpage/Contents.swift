/*:
 # 706. 设计哈希映射
 
 不使用任何内建的哈希表库设计一个哈希映射（HashMap）。

 实现 `MyHashMap` 类：

 * `MyHashMap()` 用空映射初始化对象
 * `void put(int key, int value)` 向 `HashMap` 插入一个键值对 `(key, value)` 。如果 `key` 已经存在于映射中，则更新其对应的值 `value` 。
 * `int get(int key)` 返回特定的 `key` 所映射的 `value` ；如果映射中不包含 `key` 的映射，返回 `-1` 。
 * `void remove(key)` 如果映射中存在 `key` 的映射，则移除 `key` 和它所对应的 `value` 。

 __示例：__
 
 ```
 输入：
 ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
 [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
 输出：
 [null, null, null, 1, -1, null, 1, null, -1]

 解释：
 MyHashMap myHashMap = new MyHashMap();
 myHashMap.put(1, 1); // myHashMap 现在为 [[1,1]]
 myHashMap.put(2, 2); // myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.get(1);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.get(3);    // 返回 -1（未找到），myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.put(2, 1); // myHashMap 现在为 [[1,1], [2,1]]（更新已有的值）
 myHashMap.get(2);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,1]]
 myHashMap.remove(2); // 删除键为 2 的数据，myHashMap 现在为 [[1,1]]
 myHashMap.get(2);    // 返回 -1（未找到），myHashMap 现在为 [[1,1]]
 ```
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/design-hashmap
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//: 代码模板

class MyHashMap {

    /** Initialize your data structure here. */
    init() {

    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {

    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {

    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {

    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

//: [Next](@next)
