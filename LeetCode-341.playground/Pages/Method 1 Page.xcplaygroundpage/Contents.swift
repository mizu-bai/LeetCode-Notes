//: [Previous](@previous)

/*:
 # 方法一：递归
 
 构造函数中提前「扁平化」整个嵌套列表
 
 ## 思路
 
 这个嵌套的数据结构长得像个树一样，可以  **递归** 遍历。可以使用一个队列，每次调用 `next()` 方法的时候从队列的开头弹出一个元素。
 
 遍历输入的「嵌套列表」所有的元素，判断元素是 `int` 还是 `list`。如果当前元素是 `int`，就放入队列；反之是 `list` 的时候，就需要对当前的子 `list` 继续递归。
 
 ## 复杂度分析
 
 * 时间复杂度：构造函数是 `O(n)`，`next()` 和 `hasNext()` 是 `O(1)`
 * 空间复杂度：`O(n)`，需要创建一个队列保存扁平化后的结果。
 */

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {

    var queue: [Int]

    init(_ nestedList: [NestedInteger]) {
        self.queue = [Int]()
        self.dfs(nestedList)
    }
    
    func next() -> Int {
        return self.queue.removeFirst()
    }
    
    func hasNext() -> Bool {
        return self.queue.count > 0
    }

    func dfs(_ nests: [NestedInteger]) {
        for nest in nests {
            if nest.isInteger() {
                self.queue.append(nest.getInteger())
            } else {
                self.dfs(nest.getList())
            }
        }
    }
}

//: [Next](@next)
