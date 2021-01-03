//
//  키패드누르기.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 키패드누르기 {
    func solution(_ numbers:[Int], _ hand:String) -> String {
        var leftHandPosition = 10
        var rightHandPosition = 12
        let positions: [String : (Int, Int)] = ["1" :(0,0), "2" :(0,1), "3" :(0,2),
                                                "4" :(1,0), "5" :(1,1), "6" :(1,2),
                                                "7" :(2,0), "8" :(2,1), "9" :(2,2),
                                                "10":(3,0), "0" :(3,1), "12":(3,2)]
        
        var results = [String]()
        
        for number in numbers {
            
            if number == 1 || number == 4 || number == 7 {
                // 왼손
                leftHandPosition = number
                results.append("L")
            } else if number == 3 || number == 6 || number == 9 {
                // 오른손
                rightHandPosition = number
                results.append("R")
            } else {
                // 왼손, 오른손 중 더 가까운 위치의 손
                // 거리가 같으면 오른손잡이 -> 오른손, 왼손잡이 -> 왼손
                let targetX = positions[String(number)]!.0
                let targetY = positions[String(number)]!.1
                
                let leftHands = positions[String(leftHandPosition)]!
                let rightHands = positions[String(rightHandPosition)]!
                
                let leftHandDistance = getDistance(leftHands.0, leftHands.1, targetX, targetY)
                let rightHandDistance = getDistance(rightHands.0, rightHands.1, targetX, targetY)
                
                if leftHandDistance < rightHandDistance {
                    leftHandPosition = number
                    results.append("L")
                } else if leftHandDistance > rightHandDistance {
                    rightHandPosition = number
                    results.append("R")
                } else if leftHandDistance == rightHandDistance {
                    if hand.elementsEqual("left") {
                        leftHandPosition = number
                        results.append("L")
                    } else {
                        rightHandPosition = number
                        results.append("R")
                    }
                }
            }
        }
        
        return results.joined()
    }
    
    func getDistance(_ x: Int, _ y: Int,_ targetX: Int,_ targetY: Int) -> Int {
        return abs(targetX - x) + abs(targetY - y)
    }
}
