//
//  메뉴리뉴얼.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/14.
//

import Foundation

class 메뉴리뉴얼 {
    
    var dic = [String:Int]()
    
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        // ["ABCFG", "AC", "CDE", "ACDE", "BCFG ", "ACDEH"]
        // ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
        // ["XYZ", "XWY", "WXA"]
        
        let sorted = orders.sorted(by: { $0.count < $1.count })
        var result = [String]()
        
        // 주어진 course(2,3,4) 대로 조합 생성
        for combination in course {
            for menus in sorted {
                let menu = menus.map{ String($0) }
                makeCombination(0, menu, combination, [])
            }
            
            if !dic.isEmpty {
                // 가장 많이 주문한 요리의 수
                let maxCount = dic.map{ $0.value }.max()!
                // 최소 2번 이상 손님이 주문한 경우만 체크
                if maxCount >= 2 {
                    let filterd = dic.filter{ $0.value == maxCount }.map{ $0.key }
                    result.append(contentsOf: filterd)
                }
            }
            dic.removeAll()
        }
        
        return result.sorted(by: <)
    }
    
    func makeCombination(_ index: Int, _ array: [String], _ shouldSelect: Int,_ selected: [String]) {
        if shouldSelect == 0 {
            // 한번 정렬해서 겹치는 경우 체크: AB = BA 같은경우로 봐야함
            let joined = selected.map{ String($0) }.sorted(by: <).joined()
            if let value = dic[joined] {
                dic[joined] = value + 1
            } else {
                dic[joined] = 1
            }
        } else if index == array.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(array[index])
            
            makeCombination(index+1, array, shouldSelect - 1, newSelected)
            makeCombination(index+1, array, shouldSelect, selected)
        }
    }
}
