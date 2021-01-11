//
//  main.swift
//  BaekJoon
//
//  Created by 박균호 on 2021/01/07.
//

import Foundation

var num = readLine()
var intToNum = Int(num!)!

struct Lecture {
    var start: Int
    var end: Int
}

var lectures = [Lecture]()

for _ in 0..<intToNum {
    if let testcases = readLine() {
        let arrays = testcases.split(separator: " ")
        let obj = Lecture(start: Int(arrays[0])!, end: Int(arrays[1])!)
        lectures.append(obj)
    }
}

let sorted = lectures.sorted(by: {$0.start < $1.start})
var count = 0
var temp = sorted[0]

for index in 1..<sorted.count {
    let start = sorted[index].start
    let end = sorted[index].end
    
    if temp.end >= start {
        count += 1
    }
    temp = sorted[index]
}

print(count)

