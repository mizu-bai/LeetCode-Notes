/*:
 # 341. 扁平化嵌套列表迭代器
 
 给你一个嵌套的整型列表。请你设计一个迭代器，使其能够遍历这个整型列表中的所有整数。

 列表中的每一项或者为一个整数，或者是另一个列表。其中列表的元素也可能是整数或是其他列表。
 
 __示例 1:__
 
 ```
 输入: [[1,1],2,[1,1]]
 输出: [1,1,2,1,1]
 解释: 通过重复调用 *next* 直到 *hasNext* 返回 false，*next* 返回的元素的顺序应该是: [1,1,2,1,1]。
 ```

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/flatten-nested-list-iterator
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

var str = "Hello, playground"

//: [Next](@next)