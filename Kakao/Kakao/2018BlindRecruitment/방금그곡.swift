//
//  방금그곡.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 방금그곡 {
    func solution(_ m:String, _ musicinfos:[String]) -> String {
        
        var musics = [MusicInfo]()
        var result = [(String, Int, Int)]() // (제목, 재생시간, index)
        let mToReplace = m.replaceCharacter(m)
        
        // Step1. 파싱
        for music in musicinfos {
            let infos = music.split(separator: ",")
            
            let startTime = infos[0].split(separator: ":").map{ Int($0) } // 시작시간 [시간, 분]
            let endTime = infos[1].split(separator: ":").map{ Int($0) } // 종료시간 [시간, 분]
            let title = String(infos[2]) // 노래 제목
            var melodies = String(infos[3]) // 멜로디 정보
            melodies = melodies.replaceCharacter(melodies)

            musics.append(MusicInfo(startTime: [startTime[0]!, startTime[1]!], endTime: [endTime[0]!, endTime[1]!], title: title, melody: melodies))
        }
        
        // Step2. 곡 찾기
        for music in musics {
            let startHour = music.startTime[0]
            let startMinutes = music.startTime[1]
            let endHour = music.endTime[0]
            let endMinutes = music.endTime[1]
            
            var hour = endHour - startHour // 시간
            var minutes = endMinutes - startMinutes // 분
            
            if minutes < 0 {
                hour -= 1
                minutes = 60 + minutes
            }
            
            let time = hour * 60 + minutes // 플레이 시간(분)

            let melodyCount = music.melody.count
            var melodyTime: String = ""
            
            if time > melodyCount {
                for _ in 0..<time/melodyCount {
                    melodyTime += music.melody
                }
                melodyTime += music.melody.prefix(time%melodyCount)
            } else {
                melodyTime = String(music.melody.prefix(time))
            }
            
            if melodyTime.contains(mToReplace) {
                result.append((music.title, time, result.count))
            }
        }

        if !result.isEmpty {
            result = result.sorted(by: {$0.1 > $1.1})
            return result[0].0
        }
        
        return "(None)"
    }
    
    struct MusicInfo {
        var startTime: [Int]
        var endTime: [Int]
        var title: String
        var melody: String
    }
}
extension String {
    func replaceCharacter(_ str: String) -> String {
        var melody = str
        melody = melody.replacingOccurrences(of: "A#", with: "1")
        melody = melody.replacingOccurrences(of: "C#", with: "2")
        melody = melody.replacingOccurrences(of: "D#", with: "3")
        melody = melody.replacingOccurrences(of: "F#", with: "4")
        melody = melody.replacingOccurrences(of: "G#", with: "5")
        return melody
    }
}
