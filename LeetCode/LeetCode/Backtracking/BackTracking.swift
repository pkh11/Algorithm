//
//  BackTracking.swift
//  LeetCode
//
//  Created by 박균호 on 2021/04/14.
//

import Foundation

class BackTracking {
    
    func numberOfMatches(_ n: Int) -> Int {
        let result = matches(n, 0)
        print(result)
        return result
    }
    
    func matches(_ teams: Int, _ match: Int) -> Int {
        let numberOfTeams = teams
        
        if numberOfTeams == 2 {
            return match + 1
        }

        if numberOfTeams % 2 == 0 {
            return matches(numberOfTeams/2, match + numberOfTeams/2)
        } else {
            return matches((numberOfTeams-1)/2 + 1, match + (numberOfTeams-1)/2)
        }
    }
}
