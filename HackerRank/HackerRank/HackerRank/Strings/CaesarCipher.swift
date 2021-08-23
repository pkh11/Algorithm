//
//  CaesarCipher.swift
//  HackerRank
//
//  Created by 박균호 on 2021/08/23.
//

import Foundation

class CaesarCipher {
    func caesarCipher(s: String, k: Int) -> String {
        // Write your code here
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let size = s.count
        var k = k % 26
        let array = Array(alphabet)
        
        let prefix = array.prefix(k)
        let suffix = array.suffix(alphabet.count-k)
        let rotated = Array(suffix + prefix)
        
        var map = [String:String]()
        
        for (index, char) in array.enumerated() {
            map[String(char)] = String(rotated[index])
        }
        
        var result = ""
        for char in s {
            if char.isLetter {
                if char.isLowercase {
                    result += "\(map[String(char)]!)"
                } else if char.isUppercase {
                    result += "\(map[char.lowercased()]!.uppercased())"
                }
            } else {
                result += "\(char)"
            }
        }
        
        print(result)
        
        return result
    }
}
