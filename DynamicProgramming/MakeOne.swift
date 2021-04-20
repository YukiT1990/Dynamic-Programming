//
//  MakeOne.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/19.
//
//  2. Make One

import Foundation

//func makeOne() {
//    let N = Int(readLine()!)!
//
//    var resultArray: [Int] = Array(repeating: 0, count: N + 1)
//
//    resultArray[1] = 0
//    if N == 1 {
//        print(0)
//        return
//    }
//
//    for i in 2...N {
//        if i % 3 == 0 {
//            resultArray[i] = resultArray[i / 3] + 1
//        } else if i % 3 == 1 {
//            // 10 -> 9 -> 3 -> 1 is better than 10 -> 5 -> 4 -> 2 -> 1
//            resultArray[i] = resultArray[i - 1] + 1
//        } else if i % 2 == 0 {
//            resultArray[i] = resultArray[i / 2] + 1
//        } else {
//            resultArray[i] = resultArray[i - 1] + 1
//        }
//    }
//
//    print(resultArray[N])
//}


func makeOne() {
    let N = Int(readLine()!)!

    var resultArray: [Int] = Array(repeating: 0, count: N + 1)

    resultArray[1] = 0
    if N == 1 {
        print(0)
        return
    }

    for i in 2...N {
        resultArray[i] = resultArray[i - 1] + 1
        if i % 2 == 0 && resultArray[i] > resultArray[i / 2] + 1 {
            resultArray[i] = resultArray[i / 2] + 1
        }
        if i % 3 == 0 && resultArray[i] > resultArray[i / 3] + 1 {
            resultArray[i] = resultArray[i / 3] + 1
        }
    }

    print(resultArray[N])
}
