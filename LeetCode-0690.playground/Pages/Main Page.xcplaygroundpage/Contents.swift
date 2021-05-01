//: [Previous](@previous)

/*:
 # 690. 员工的重要性
 
 给定一个保存员工信息的数据结构，它包含了员工 __唯一的 id__ ，__重要度__ 和 __直系下属的 id__ 。

 比如，员工 1 是员工 2 的领导，员工 2 是员工 3 的领导。他们相应的重要度为 15 , 10 , 5 。那么员工 1 的数据结构是 [1, 15, [2]] ，员工 2的 数据结构是 [2, 10, [3]] ，员工 3 的数据结构是 [3, 5, []] 。注意虽然员工 3 也是员工 1 的一个下属，但是由于 __并不是直系__ 下属，因此没有体现在员工 1 的数据结构中。

 现在输入一个公司的所有员工信息，以及单个员工 id ，返回这个员工和他所有下属的重要度之和。
 
 __示例：__

 ```
 输入：[[1, 5, [2, 3]], [2, 3, []], [3, 3, []]], 1
 输出：11
 解释：
 员工 1 自身的重要度是 5 ，他有两个直系下属 2 和 3 ，而且 2 和 3 的重要度均为 3 。因此员工 1 的总重要度是 5 + 3 + 3 = 11 。
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/employee-importance
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//: 代码模板


// Definition for Employee.
public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}


// Solution
class Solution {
    var dict = [Int: Employee]()
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        employees.map{dict[$0.id] = $0}
        return dfs(id)
    }
    func dfs( _ id: Int) -> Int {
        let employee = dict[id]!
        var total = employee.importance
        for subId in employee.subordinates {
            total += dfs(subId)
        }
        return total
    }
}

//: [Next](@next)
