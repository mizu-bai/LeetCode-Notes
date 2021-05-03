//: [Previous](@previous)

/*:
 # 方法二：一行
 
 血压有点高
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        return  (x < 0 ? -1 : 1) * Int(Int32(String(Array(String(x).filter({$0 != "-"})).reversed())) ?? 0)
    }
}

//: [Next](@next)
