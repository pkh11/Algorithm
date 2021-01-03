//
//  캐시.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

class 캐시 {
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        let cacheHit = 1
        let cacheMiss = 5
        
        var runTime = 0
        var cache = [String]()
        
        for city in cities {
            let _city = city.lowercased()
            if cache.contains(_city) {
                if let index = cache.firstIndex(of: _city) {
                    cache.remove(at: index)
                }
                cache.append(_city)
                runTime += cacheHit
            } else {
                if cacheSize != 0 {
                    if cache.count == cacheSize {
                        cache.removeFirst()
                        cache.append(_city)
                    } else if cache.count < cacheSize{
                        cache.append(_city)
                    }
                }

                runTime += cacheMiss
            }
        }
        
        print(runTime)
        
        return runTime
    }
}
