//
//  순위검색.swift
//  Kakao
//
//  Created by 박균호 on 2021/02/17.
//

import Foundation

class 순위검색 {
    func solution3(_ info:[String], _ query:[String]) -> [Int] {

        let totalList = [["java","python","cpp","-"],["backend","frontend","-"],["junior","senior","-"],["pizza","chicken","-"]]
        var possible = [[String] : [Int]]()

        var temp = [String]()
        func combination( _ idx : Int, _ list : [[String]], _ score : Int ){
            if temp.count == 4 {
                if possible[temp] == nil {
                    possible[temp] = []
                }else {
                    possible[temp]!.append(score)
                }
                return
            }else {
                for i in idx..<list.count {
                    for j in 0..<list[i].count {
                        temp.append(list[i][j])
                        combination(i+1,list,score )
                        temp.removeLast()
                    }
                }
            }
        }
        combination(0,totalList,0)

        

        info.forEach{
            var list = $0.split(separator : " " ).map{[String($0),"-"]}
            let score = list.removeLast()
            combination(0, list, Int(score[0])!)
        }
        for key in possible.keys {
            possible[key] = possible[key]!.sorted()
        }
        
        print(possible)

        var answer = [Int]()

        query.forEach {
            var query = $0.split(separator : " ").map{String($0)}.filter{($0 != "and")}
            let score = Int(query.removeLast())!

            if possible[query] == nil {
                answer.append(0)
            }else {
                var l = 0 , r = possible[query]!.count-1
                while l<=r {
                    let mid = (r+l)/2
                    if possible[query]![mid] >= score {
                        r = mid - 1
                    }else {
                        l = mid + 1
                    }
                }
                answer.append(possible[query]!.count - l)
            }
        }

        return answer
    }
    
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

//            if infos.contains(where: { $0.key == queryKey }) {
//                let scores = infos.filter{ $0.key == queryKey }.map{ $0.value }.first!
//                print(scores)
//                let size = scores.count
//                if size > 0 {
//                    var start = 0
//                    var end = size - 1
//                    var mid = 0
//                    while end > start {
//                        mid = (start + end) / 2
//                        if scores[mid] >= value {
//                            end = mid - 1
//                        } else {
//                            start = mid + 1
//                        }
//                    }
//                    result.append(size - start)
//                }
//            } else {
//                result.append(0)
//            }
        }
        
        print(result)
        
        
        return []
    }
    
    func lowerBound() {
        
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


