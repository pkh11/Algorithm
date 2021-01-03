//
//  추석트래픽.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 추석트래픽 {
    
    var traffics = [Traffic]()
    
    func solution(_ lines:[String]) -> Int {
        
        for line in lines {
            let splited = line.split(separator: " ")
            let times = splited[1].split(separator: ":")
            let excutionTime = splited[2].dropLast()
            
            let data = Traffic(hour: String(times[0]), minute: String(times[1]), seconds: String(times[2]), excutionTime: String(excutionTime))
            traffics.append(data)
        }
        
        var maxCount = 0
        for i in 0..<traffics.count {
            var count = 1
            let endTime = traffics[i].endTime
            for j in i+1..<traffics.count {
                if traffics[j].startTime < endTime + 1000 {
                    count += 1
                }
            }
            maxCount = max(count, maxCount)
        }
        print(maxCount)
        return maxCount
    }
    
    struct Traffic {
        // ms 기준
        var hour: String
        var minute: String
        var seconds: String
        var excutionTime: String
        
        var hourToMS: Float{
            return Float(hour)! * 60 * 60 * 1000
        }
        var minToMS: Float{
            return Float(minute)! * 60 * 1000
        }
        var secToMS: Float{
            return Float(seconds)! * 1000
        }
        var execTime: Float{
            return Float(excutionTime)! * 1000
        }
        
        var startTime: Float {
            return hourToMS + minToMS + secToMS - execTime + 1
        }
        var endTime: Float {
            return hourToMS + minToMS + secToMS
        }
    }
}
