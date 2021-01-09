//
//  셔틀버스.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/09.
//

import Foundation

class 셔틀버스 {
    func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
        
        var shuttles = [ShuttleInfo]()
        var timeTables = [Passenger]()
        var con = 0
        
        // step1. 셔틀정보
        var gap = -t
        for _ in 1...n {
            let startTime = 540 // 9시
            gap += t
            
            let shuttle = ShuttleInfo(shuttleTime: startTime + gap, passengers: [])
            shuttles.append(shuttle)
        }
        
        // step2. time table 파싱
        for time in timetable {
            let info = time.split(separator: ":")
            let hour = Int(info[0])!
            let minutes = Int(info[1])!
            
            let passenger = Passenger(waitingTime: hour*60+minutes)
            timeTables.append(passenger)
        }
        
        timeTables = timeTables.sorted(by: {$0.waitingTime < $1.waitingTime})
        
        // step3. shuttle에 탑승하기
        var bus = shuttles
        
        for (index, shuttle) in shuttles.enumerated() {
            while !timeTables.isEmpty {
                let passengers = timeTables.first!
                
                if bus[index].passengers.count == m {
                    break
                } else {
                    if passengers.waitingTime >= shuttle.shuttleTime + t {
                        break
                    }
                    bus[index].passengers.append(passengers)
                    timeTables.removeFirst()
                }
            }
        }
        
        // step4. con이 탑승 할 시각 구하기
        let lastShuttle = bus.last!
        
        if !lastShuttle.passengers.isEmpty {
            let lastPassenger = lastShuttle.passengers.last!.waitingTime
            if lastShuttle.passengers.count < m {
                if lastShuttle.shuttleTime > lastPassenger {
                    con = lastShuttle.shuttleTime
                } else {
                    con = lastPassenger - 1
                }
            } else {
                con = lastPassenger - 1
            }
        } else {
            con = lastShuttle.shuttleTime
        }
        
        return con.intToTime(with: con)
    }
}
struct ShuttleInfo {
    var shuttleTime: Int
    var passengers: [Passenger]
}
struct Passenger {
    var waitingTime: Int
}

extension Int {
    func intToTime(with time: Int) -> String {
        let hour = time / 60
        let minutes = time % 60
        var h = ""
        var m = ""
        
        if hour >= 0 && hour < 10 {
            h = "0\(hour)"
        } else {
            h = "\(hour)"
        }
        if minutes >= 0 && minutes < 10 {
            m = "0\(minutes)"
        } else {
            m = "\(minutes)"
        }
        return "\(h):\(m)"
    }
}
