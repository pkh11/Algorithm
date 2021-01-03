//
//  스킬트리.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 스킬트리 {
    
    // skill : CBD
    // skill_trees: ["BACDE", "CBADF", "AECB", "BDA"]
    func solution(_ skill:String, _ skill_trees:[String]) -> Int {
        
        var result = 0
        
        for trees in skill_trees {
            let list = trees.filter{ skill.contains($0) }
            let prefix = skill.prefix(list.count)

            if prefix == list {
                result += 1
            }
        }
        
        return result
    }
    
    func solutions3(_ skill:String, _ skill_trees:[String]) -> Int {
        var result = 0
                
        for trees in skill_trees {
            let list = trees.filter{ skill.contains($0) }
            print(list)
            if skill.starts(with: list) {
                result += 1
            }
            print(result)
        }

        return result
    }
    
    func solution2(_ skill:String, _ skill_trees:[String]) -> Int {
        var result = 0
                
            for trees in skill_trees {
                var name = ""
                for skillName in trees {
                    if skill.contains(skillName) {
                        name.append(skillName)
                    }
                }

                if name.contains(skill[...skill.startIndex]) {
                    if isContainSkillTree(skill, name) {
                        result += 1
                    }
                }

            }
            return result
    }
    
    func isContainSkillTree (_ skill: String, _ filtered: String) -> Bool {
        if skill.elementsEqual(filtered) || skill.contains(filtered) {
            return true
        }
        return false
    }
}
