//
//  순위검색.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/17.
//

import Foundation

class 순위검색 {
    func solution2(_ info:[String], _ query:[String]) -> [Int] {
        
        var infos = [String:[Int]]()
        var result = [Int]()
        
        for userinfo in info {
            var information = userinfo.split(separator: " ").map{ String($0) }
            let value = Int(information.removeLast())!
            
            let languages = [information[0], "-"]
            let jobs = [information[1], "-"]
            let careers = [information[2], "-"]
            let foods = [information[3], "-"]
            
            languages.forEach { lan in
                jobs.forEach { job in
                    careers.forEach { career in
                        foods.forEach { food in
                            let key = lan + job + career + food
                            if let _ = infos[key] {
                                infos[key]!.append(value)
                            } else {
                                infos[key] = [value]
                            }
                        }
                    }
                }
            }
        }
        
        for key in infos.keys {
            infos[key] = infos[key]!.sorted()
        }
        
        print(infos)
        
        for q in query {
            var queries = q.split(separator: " ").filter{ $0 != "and" }
            let score = Int(queries.removeLast())!

            let queryKey = queries.joined()
            
            if infos[queryKey] == nil {
                result.append(0)
            } else {
                let size = infos[queryKey]!.count
                var start = 0
                var end = size - 1
                
                while start <= end {
                    let mid = (start+end)/2
                    if infos[queryKey]![mid] >= score {
                        end = mid - 1
                    }else {
                        start = mid + 1
                    }
                }
                result.append(size - start)
            }
        }
        
        return result
    }
    
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        
        var infos = [UserInfo]()
        var result = [Int]()
        
        for userinfo in info {
            let information = userinfo.split(separator: " ").map{ String($0) }
            infos.append(UserInfo(language: information[0], job: information[1], year: information[2], food: information[3], value: Int(information[4])!))
        }
        
        infos = infos.sorted(by: { $0.value > $1.value })
        
        for q in query {
            var queries = q.split(separator: " ").filter{ $0 != "and" }
            let value = Int(queries.removeLast())!
            
            let language = queries[0]
            let job = queries[1]
            let year = queries[2]
            let food = queries[3]
            
            let str = queries.filter{ $0 != "-" }.joined()
            
            var count = 0

            for user in infos {
                var userString = ""
                if language != "-" {
                    userString += user.language
                }
                if job != "-" {
                    userString += user.job
                }
                if year != "-" {
                    userString += user.year
                }
                if food != "-" {
                    userString += user.food
                }
                
                if str.isEmpty {
                    if user.value >= value {
                        count += 1
                    }
                } else {
                    if userString.contains(str) && user.value >= value {
                        count += 1
                    }
                }
            }
            result.append(count)
        }
        print(result)
        
        return result
    }
}

struct UserInfo {
    var language: String
    var job: String
    var year: String
    var food: String
    var value: Int
}


