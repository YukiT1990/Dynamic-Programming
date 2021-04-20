//
//  OneTwoThree.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/19.
//
//  5. One Two Three

import Foundation

func oneTwoThree() {
    let numOfNs = Int(readLine()!)!
    if numOfNs == 0 {
        print(0)
        return
    }
    
    var nArray: [Int] = []

    for _ in 0..<numOfNs {
        let input = Int(readLine()!)!
        nArray.append(input)
    }
    
    let maxN = nArray.max()!
    var resultArray: [Int] = Array(repeating: 0, count: maxN + 1)
    
    resultArray[1] = 1
    if maxN > 1 {
        resultArray[2] = 2
    }
    if maxN > 2 {
        resultArray[3] = 4
    }
    
    if maxN > 3 {
        for i in 4...maxN {
            resultArray[i] = resultArray[i - 1] + resultArray[i - 2] + resultArray[i - 3]
        }
    }
    
    for i in 0..<nArray.count {
        let n = nArray[i]
        print(resultArray[n])
    }
}



