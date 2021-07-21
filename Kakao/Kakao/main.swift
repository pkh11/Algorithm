//
//  main.swift
//  Kakao
//
//  Created by 박균호 on 2021/01/03.
//

import Foundation

let no1 = 추석트래픽()
//no1.solution(["2016-09-15 01:00:04.001 2.0s", "2016-09-15 01:00:07.000 2s"])
//no1.solution([
//    "2016-09-15 20:59:57.421 0.351s",
//    "2016-09-15 20:59:58.233 1.181s",
//    "2016-09-15 20:59:58.299 0.8s",
//    "2016-09-15 20:59:58.688 1.041s",
//    "2016-09-15 20:59:59.591 1.412s",
//    "2016-09-15 21:00:00.464 1.466s",
//    "2016-09-15 21:00:00.741 1.581s",
//    "2016-09-15 21:00:00.748 2.31s",
//    "2016-09-15 21:00:00.966 0.381s",
//    "2016-09-15 21:00:02.066 2.62s"
//    ])

let no2 = 체육복()
//print(no2.solution(5, [2, 4], [1,3,5]))
//print(no2.solution(5, [2, 4], [3]))
//print(no2.solution(3, [3], [1]))
//print(no2.solution(5, [1, 3], [5]))

let no3 = 조이스틱()
//no3.solution("JEROEN")
//no3.solution("JAN")

let no4 = 큰수만들기()
//no4.solution("1924", 2)
//no4.solution("1231234", 3)
//no4.solution("4177252841", 4)

let no5 = 셔틀버스()
//no5.solution(1, 1, 5,["08:00", "08:01", "08:02", "08:03"])
//no5.solution(2, 10, 2,["09:10", "09:09", "08:00"])
//no5.solution(2, 1, 2,["09:00", "09:00", "09:00", "09:00"])
//no5.solution(1, 1, 5,["00:01", "00:01", "00:01", "00:01"])
//no5.solution(1, 1, 1,["23:59"])
//no5.solution(10, 60, 45,["23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59","23:59"])

let no6 = 길찾기게임()
//no6.solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]])

let no7 = 기둥과보설치()
//no7.solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]])
//no7.solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]])

let no8 = 신규아이디추천()
no8.solution2("...!@BaT#*..y.abcdefghijklm")
no8.solution2("z-+.^.")
no8.solution2("=.=")
no8.solution2("123_.def")
no8.solution2("abcdefghijklmn.p")

let no9 = 메뉴리뉴얼()
//no9.solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
//no9.solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
//no9.solution(["XYZ", "XWY", "WXA"], [2,3,4])

let no10 = 순위검색()
// -
//no10.solution2(["java backend junior pizza 150",
//               "python frontend senior chicken 210",
//               "python frontend senior chicken 150",
//               "cpp backend senior pizza 260",
//               "java backend junior chicken 80",
//               "python backend senior chicken 50"],
//              ["java and backend and junior and pizza 100",
//               "python and frontend and senior and chicken 200",
//               "cpp and - and senior and pizza 250",
//               "- and backend and senior and - 150",
//               "- and - and - and chicken 100",
//               "- and - and - and - 150"])

let no11 = 외벽점검()
//no11.solution(12, [1,5,6,10], [1,2,3,4])
//no11.solution(12, [1,3,4,9,10], [3,5,7])

let no12 = 블록이동하기()
//no12.solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]])


let kno1 = KaKaoEnterpriseNo1()

let kno2 = KaKaoEnterpriseNo2()

let kno3 = KaKaoEnterpriseNo3()
//kno3.minOperations(n: 4)

let kno4 = KaKaoEnterpriseNo4()
//kno4.getEventsOrder(team1: "edc", team2: "cde", events1: ["alex 12 G", "sam 43 Y"], events2: ["kris 45+1 S avery","robin 46 G"])
//kno4.getEventsOrder(team1: "abc", team2: "cda", events1: ["mo sa 45+2 Y", "a 13 G"], events2: ["d 23 S f","z 46 G"])


//[3, 5]
//[1, 6]
//[1, 1]


let lotto = 로또의최고순위와최저순위()
//print(lotto.solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
//print(lotto.solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))
//print(lotto.solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))

let taxi = 합승택시요금()
//taxi.solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]])
//taxi.solution(7, 3, 4, 1, [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]])
//taxi.solution(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]])


let ss = 조이스틱2()
//ss.solution("JAZ")
//ss.solution("JERON")
//ss.solution("JAN")

let words = 숫자문자열과영단어()
words.solution("one4seveneight")
words.solution("23four5six7")
words.solution("2three45sixseven")
words.solution("123")

