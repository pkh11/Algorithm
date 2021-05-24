//
//  no4.swift
//  Kakao
//
//  Created by 박균호 on 2021/04/15.
//

import Foundation

class KaKaoEnterpriseNo4 {
    func getEventsOrder(team1: String, team2: String, events1: [String], events2: [String]) -> [String] {
        
        
        var sizeOfEvents1 = events1.count
        var sizeOfEvents2 = events2.count
        
        var arrays = Array(repeating: Team(teamName: "", employName: "", time: "", extraTime: "", event: "", secondEmployName: ""), count: sizeOfEvents1+sizeOfEvents2)
        
        for i in 0..<sizeOfEvents1 {
            let obj = events1[i].split(separator: " ").map{ String($0) }
            var size = obj.count
//            print(obj)
            var event = obj[size-1]
            var secondEmplyName = ""
            
            var time = ""
            var extraTime = ""
            var employName = ""
            
            if event == "G" || event == "Y" || event == "R" {
                let hasPlus = obj[size-2].contains("+")
                if hasPlus {
                    let splited = obj[size-2].split(separator: "+")
                    time = String(splited[0])
                    extraTime = String(splited[1])
                } else {
                    time = obj[size-2]
                }
                employName = obj[0..<size-2].joined(separator: " ")
            } else {
                event = obj[size-2]
                secondEmplyName = obj[size-1]
                
                let hasPlus = obj[size-3].contains("+")
                if hasPlus {
                    let splited = obj[size-3].split(separator: "+")
                    time = String(splited[0])
                    extraTime = String(splited[1])
                } else {
                    time = obj[size-3]
                }
                employName = obj[0..<size-3].joined(separator: " ")
            }
            
            let teamName = team1
            
            arrays[i] = Team(teamName: teamName, employName: employName, time: time, extraTime: extraTime, event: event, secondEmployName: secondEmplyName)
        }
        
        for j in sizeOfEvents1..<sizeOfEvents1+sizeOfEvents2 {
            let obj = events2[j-sizeOfEvents2].split(separator: " ").map{ String($0) }
            var size = obj.count
//            print(obj)
            var event = obj[size-1]
            var secondEmplyName = ""
            
            var time = ""
            var extraTime = ""
            var employName = ""
            
            if event == "G" || event == "Y" || event == "R" {
                let hasPlus = obj[size-2].contains("+")
                if hasPlus {
                    let splited = obj[size-2].split(separator: "+")
                    time = String(splited[0])
                    extraTime = String(splited[1])
                } else {
                    time = obj[size-2]
                }
                employName = obj[0..<size-2].joined(separator: " ")
            } else {
                event = obj[size-2]
                secondEmplyName = obj[size-1]
                
                let hasPlus = obj[size-3].contains("+")
                if hasPlus {
                    let splited = obj[size-3].split(separator: "+")
                    time = String(splited[0])
                    extraTime = String(splited[1])
                } else {
                    time = obj[size-3]
                }
                employName = obj[0..<size-3].joined(separator: " ")
            }
            
            let teamName = team2
            
            arrays[j] = Team(teamName: teamName, employName: employName, time: time, extraTime: extraTime, event: event, secondEmployName: secondEmplyName)
        }
        
        arrays = arrays.sorted(by: { $0.time < $1.time })
        
        var result = [String]()
        
        for obj in arrays {
            var text = ""
            if !obj.extraTime.isEmpty {
                text = "\(obj.teamName) \(obj.employName) \(obj.time)+\(obj.extraTime) \(obj.event)"
                if !obj.secondEmployName.isEmpty {
                    text += " \(obj.secondEmployName)"
                }
            } else {
                text = "\(obj.teamName) \(obj.employName) \(obj.time) \(obj.event)"
                if !obj.secondEmployName.isEmpty {
                    text += " \(obj.secondEmployName)"
                }
            }
            
            result.append(text)
        }
        
        print(result)
        
        return []
    }
    struct Team {
        var teamName: String
        var employName: String
        var time: String
        var extraTime: String
        var event: String
        var secondEmployName: String
    }
}
