//
//  RansomeNode.swift
//  HackerRank
//
//  Created by 박균호 on 2021/03/30.
//

import Foundation

class RansomeNote {
    func checkMagazine(magazine: [String], note: [String]) -> Void {

        var dic: [String:Int] = [:]
        
        for word in magazine {
            if let value = dic[word] {
                dic[word] = value + 1
            } else {
                dic[word] = 1
            }
        }
        
//        print(dic)
        for word in note {
            if let value = dic[word] {
                dic[word] = value - 1
                if dic[word]! <= -1 {
                    print("No")
                    return
                }
            } else {
                print("No")
                return
            }
        }
        
        print("Yes")
        return
    }
}
