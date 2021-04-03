//
//  No1.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/03.
//

import Foundation

class No1 {
    func solution(_ gift_cards:[Int], _ wants:[Int]) -> Int {
        
        // 같은 번호 찾기
        var giftCards = gift_cards
        var wants = wants
        
        var size = gift_cards.count - 1
        
        for i in 0...size {
            if giftCards[i] == wants[i] {
                giftCards[i] = -1
                wants[i] = -1
            }
        }
        
        giftCards = giftCards.filter({ $0 != -1 })
        wants = wants.filter({ $0 != -1 })

        
//        print("//////")
//        print(giftCards)
//        print(wants)
        
        // 내림차순 비교
        size = giftCards.count - 1
        giftCards = giftCards.sorted(by: >)
        
        for i in 0...size {
            if giftCards[i] == wants[i] {
                giftCards[i] = -1
                wants[i] = -1
            }
        }
        
        giftCards = giftCards.filter({ $0 != -1 })
        wants = wants.filter({ $0 != -1 })
        
//        print("//////")
//        print(giftCards)
//        print(wants)
        
        // 오름차순 비교
        size = giftCards.count - 1
        giftCards = giftCards.sorted(by: <)
        
        for i in 0...size {
            if giftCards[i] == wants[i] {
                giftCards[i] = -1
                wants[i] = -1
            }
        }
        
        giftCards = giftCards.filter({ $0 != -1 })
        wants = wants.filter({ $0 != -1 })
        
//        print("//////")
//        print(giftCards)
//        print(wants)
        
        return giftCards.count
    }
}
