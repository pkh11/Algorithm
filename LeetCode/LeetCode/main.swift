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
//greedy.lemonadeChange([5,5,5,10,20])
//greedy.lemonadeChange([5,5,10])
//greedy.lemonadeChange([10,10])
//print(greedy.lemonadeChange([5,5,10,10,20]))
//greedy.lemonadeChange([5,5,5,5,20,20,5,5,20,5])

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
//string.freqAlphabets("10#11#12")
//string.freqAlphabets("1326#")
//string.freqAlphabets("25#")
//string.freqAlphabets("12345678910#11#12#13#14#15#16#17#18#19#20#21#22#23#24#25#26#")
//string.firstUniqChar("leetcode")
//string.firstUniqChar("loveleetcode")
//string.firstUniqChar("cc")

let dfs = DFS()
//dfs.sortedArrayToBST([-10,-3,0,5,9])

let dp = DP()
//dp.minCostClimbingStairs([10, 15, 20])
//dp.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
//dp.divisorGame(2)
//dp.divisorGame(3)

let ar = _Array()
//ar.findMaxAverage([1,12,-5,-6,50,3], 4)
//ar.containsDuplicate([1,2,3,1])
//print(ar.containsNearbyDuplicate([1,2,3,1], 3))
//print(ar.containsNearbyDuplicate([1,0,1,1], 1))
//print(ar.containsNearbyDuplicate([1,2,3,1,2,3], 2))
//ar.findDisappearedNumbers([4,3,2,7,8,2,3,1])
//print(ar.missingNumber([9,6,4,2,3,5,7,0,1]))
ar.singleNumber([2,2,1])
ar.singleNumber([4,1,2,1,2])
ar.singleNumber([1])


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
