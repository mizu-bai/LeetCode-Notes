//: [Previous](@previous)

/*:
 # 方法二：广度优先搜索
 
 ## 复杂度分析
 
 * 时间复杂度：`O(n)`
 * 空间复杂度：`O(n)`
 */

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
        // for employee in employees {
        //     dict[employee.id] = employees
        // }
        employees.map({self.dict[$0.id] = $0})
        var total = 0
        var queue = [Int]()
        queue.append(id)
        while !queue.isEmpty {
            let curId = queue.removeFirst()
            let employee = dict[curId]
            total += employee!.importance
            for subId in employee!.subordinates {
                queue.append(subId)
            }
        }
        return total
    }
}

//: [Next](@next)
