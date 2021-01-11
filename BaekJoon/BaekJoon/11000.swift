//
//  11000.swift
//  BaekJoon
//
//  Created by 박균호 on 2021/01/07.
//

import Foundation


class 강의실배정 {
    var num = readLine()
    var aa = Int(self.num)

    struct Lecture {
        var start: Int
        var end: Int
    }

    for _ in 0..<aa {
        if let testcases = readLine() {
            var arrays = testcases.split(separator: " ")
            var obj = Lecture(start: arrays[0], end: arrays[1])
            print(arrays)
        }
    }
}
