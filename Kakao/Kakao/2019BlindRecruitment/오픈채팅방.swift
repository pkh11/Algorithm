//
//  오픈채팅방.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 오픈채팅방 {
    
    func solution(_ record:[String]) -> [String] {
        
        let records = record
        var keyTables = [String : String]()
        var messages = [Transaction]()
        var results = [String]()
        
        let enterMessage = "님이 들어왔습니다."
        let leaveMessage = "님이 나갔습니다."
        
        for record in records {
            let command = record.split(separator: " ")
            
            let type = command[0]
            let uid = String(command[1])
            var name = ""
            
            if command.count == 3 {
                name = String(command[2])
            }
            
            if type == Type.Enter.rawValue {
                messages.append(Transaction(uid: uid, message: enterMessage))
                keyTables[uid] = name
            } else if type == Type.Leave.rawValue {
                messages.append(Transaction(uid: uid, message: leaveMessage))
            } else {
                keyTables[uid] = name
            }
        }
        
        for msg in messages {
            results.append("\(keyTables[msg.uid]!)"+"\(msg.message)")
        }
        
        print(results)
        return results
    }
}

struct Transaction {
    var uid: String
    var message: String
}

enum Type: String {
    case Enter = "Enter"
    case Change = "Change"
    case Leave = "Leave"
}
