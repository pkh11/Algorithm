//
//  main.swift
//  LeedCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

let greedy = Greedy()
//greedy.isSubsequence2("rjufvjafbxnbgriwgokdgqdqewn", "mjmqqjrmzkvhxlyruonekhhofpzzslupzojfuoztvzmmqvmlhgqxehojfowtrinbatjujaxekbcydldglkbxsqbbnrkhfdnpfbuaktupfftiljwpgglkjqunvithzlzpgikixqeuimmtbiskemplcvljqgvlzvnqxgedxqnznddkiujwhdefziydtquoudzxstpjjitmiimbjfgfjikkjycwgnpdxpeppsturjwkgnifinccvqzwlbmgpdaodzptyrjjkbqmgdrftfbwgimsmjpknuqtijrsnwvtytqqvookinzmkkkrkgwafohflvuedssukjgipgmypakhlckvizmqvycvbxhlljzejcaijqnfgobuhuiahtmxfzoplmmjfxtggwwxliplntkfuxjcnzcqsaagahbbneugiocexcfpszzomumfqpaiydssmihdoewahoswhlnpctjmkyufsvjlrflfiktndubnymenlmpyrhjxfdcq")
//greedy.maxProfit([7,1,5,3,6,4])
//greedy.findContentChildren([1,2,3], [1,1])
//greedy.totalMoney(4)
//greedy.totalMoney(20)
//greedy.maximumUnits([[1,3],[2,2],[3,1]], 4)
//greedy.maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10)
//greedy.maxDepth([3,9,20,nil,nil,15,7])
//greedy.balancedStringSplit("RLRRLLRLRL")
//greedy.lastStoneWeight([2,7,4,1,8,1])
//greedy.lastStoneWeight([2,2])
//greedy.lastStoneWeight([1])
//greedy.minSubsequence([4,3,10,9,8])
//greedy.minSubsequence([4,4,7,6,7])

let string = _String()
//string.longestCommonPrefix(["flower","flow","flight"])
//print(string.detectCapitalUse("FlaG"))
//print(string.countAndSay(3))
//string.romanToInt("LVIII")
//string.romanToInt("MCMXCIV")
//string.numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"])
//string.mostCommonWord("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"])
//string.mostCommonWord("a, a, a, a, b,b,b,c, c", ["a"])
//string.mostCommonWord("Bob", [])
//string.reverseWords("Let's take LeetCode contest")
//string.defangIPaddr("1.1.1.1")
//string.isValid("()")
//string.maxNumberOfBalloons("nlaebolko")
//string.canConstruct("aa", "aab")
//string.canConstruct("aa", "aab")

let dfs = DFS()
//dfs.sortedArrayToBST([-10,-3,0,5,9])

let dp = DP()
dp.minCostClimbingStairs([10, 15, 20])
dp.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


 
public class Node {
  public var val: Int
  public var children: [Node]
  public init(_ val: Int) {
      self.val = val
      self.children = []
  }
}

