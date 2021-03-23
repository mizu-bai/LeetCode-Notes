//: [Previous](@previous)

/*:
 # 方法二：迭代
 
 调用 `hasNext()` 或 `next()` 方法的时候扁平化当前的嵌套子列表
 
 ## 思路
 
 在这个方法中，对「嵌套列表」进行逆序遍历，将遍历的结果放入栈中。然后在 `hasNext()` 方法中，判断栈顶元素的类型，如果是 `int` 就直接弹出，反之就把当前列表的元素逆序放入栈中。当栈为空的时候，就完成了扁平操作。
 
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

    var stack: [NestedInteger]

    init(_ nestedList: [NestedInteger]) {
        self.stack = [NestedInteger]()
        for i in (0 ..< nestedList.count).reversed() {
            self.stack.append(nestedList[i])
        }
    }
    
    func next() -> Int {
        let cur = self.stack.popLast()!
        return cur.getInteger()
    }
    
    func hasNext() -> Bool {
        while self.stack.count > 0 {
            let cur = self.stack.last!
            if cur.isInteger() {
                return true
            }
            self.stack.popLast()!
            for i in (0 ..< cur.getList().count).reversed() {
                self.stack.append(cur.getList()[i])
            }
        }
        return false
    }
}
