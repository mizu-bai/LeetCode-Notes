//: [Previous](@previous)

/*:
 # 方法一
 
 ## 思路
 
 字典树有以下字段：
 
 * 指向子节点的指针数组 `children`，对于本题而言，数组长度为 `26`，即所有的小写字母；
 * 变量 `isEndChar`，表示该节点是否是字符串的末尾。
 
 1. 插入：
 
    * 如果子节点存在，移动到下一节点，继续处理下一个字符；
    * 如果子节点为空，创建一个新的子节点，记录在 `childen` 数组的对应位置，继续处理下一个字符。

 重复处理以上步骤，直到处理字符串的最后一个字符，然后将当前节点标记为字符串结尾。
 
 2. 查找：
 
    * 子节点存在，沿着指针移动到子节点，继续搜索下一字符
    * 子节点不存在，说明不包含该前缀，返回 `false`
 
 重复以上步骤，直到遍历到空或者搜索完最后一个字符，如果搜索到了末尾，就说明存在该前缀。如果前缀末尾对应的节点的 `isEndChar` 为 `true` 说明字典树存在该字符串。
 
 ## 复杂度分析
 
 * 时间复杂度：初始化 `O(1)`，其余操作为 `O(|S|)`，其中 `|S|` 是字符串的长度
 * 空间复杂度：`O(|T| * Sigma)`，其中 `|T|` 是所有插入字符串的长度之和， `Sigma` 是字符集的大小，本题 `Sigma = 26`
 */

class Trie {

    var children: [Trie?]
    var isEndChar: Bool

    /** Initialize your data structure here. */
    init() {
        self.children = [Trie?](repeating: nil, count: 26)
        self.isEndChar = false
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node: Trie? = self
        for char in word {
            let code = Int(char.asciiValue! - Character("a").asciiValue!)
            if node?.children[code] == nil {
                node?.children[code] = Trie()
            }
            node = node?.children[code]
        }
        node?.isEndChar = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node: Trie? = self
        for char in word {
            let code = Int(char.asciiValue! - Character("a").asciiValue!)
            node = node?.children[code]
            if node == nil {
                return false
            }
        }
        return node!.isEndChar
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node: Trie? = self
        for char in prefix {
            let code = Int(char.asciiValue! - Character("a").asciiValue!)
            node = node?.children[code]
            if node == nil {
                return false
            }
        }
        return true
    }
}

//: [Next](@next)
