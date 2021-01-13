//
//  392.swift
//  LeedCode
//
//  Created by 박균호 on 2021/01/11.
//

import Foundation

class Greedy {
    
    func totalMoney(_ n: Int) -> Int {
        
        let week = n/7
        let days = n%7
            
        let moneyOfWeek = [1, 2, 3, 4, 5, 6, 7]
        var money = 0
        
        if week == 0 {
            for i in 0..<days {
                money += moneyOfWeek[i]
            }
        } else {
            for w in 0..<week {
                money += 28 + w*7
            }
            for day in 0..<days {
                money += (moneyOfWeek[day] + week)
            }
        }
        
        print(money)

        return money
    }
    
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        
        let sortedG = g.sorted(by: <)
        let sortedS = s.sorted(by: <)
        var i = 0
        var j = 0
        
        while i<sortedG.count && j<sortedS.count {
            if sortedG[i] <= sortedS[j] {
                i+=1
            }
            j+=1
        }
        
        print(i)
        
        return 0
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
            }
        }
        
        print(profit)
        return 0
    }
    
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        // s = abc
        // t = ahbgdc
        
        let array1 = Array(s).map{ String($0) }
        let array2 = Array(t).map{ String($0) }
        var result = false
        
        var str = ""
        var index = 0
        for i in 0..<array1.count {
            for j in index..<array2.count {
                if array1[i] == array2[j] {
                    str += array2[j]
                    index = j + 1
                    break
                }
            }
        }
        
        if s.elementsEqual(str) {
            result = true
        }
        
        return result
    }
}
