//
//  Tiles.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/19.
//
//  3. 2 x N tiles

import Foundation

func tiles() {
    let N = Int(readLine()!)!
    
    var resultArray: [Int] = Array(repeating: 0, count: N + 1)
    
    resultArray[1] = 1
    if N > 1 {
        resultArray[2] = 2
    }
    
    if N == 1 {
        print(N)
        return
    } else if N == 2 {
        print(N)
        return
    }
    
    for i in 3...N {
        // 1. the number of filling up 2* N-1 tiles and one 2*1 tile at the last
        // 2. the number of filling up 2* N-2 tiles and two 1*2 tiles at the last
        // ("two 2*1 tiles at the last" is included in 1)
        resultArray[i] = resultArray[i - 1] + resultArray[i - 2]
    }
    
    print(resultArray[N])
}
