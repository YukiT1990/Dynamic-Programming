//
//  TilesMinusTwo.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/19.
//
//  4. 2 x N tiles - 2

import Foundation

func tilesMinusTwo() {
    let N = Int(readLine()!)!
    
    var resultArray: [Int] = Array(repeating: 0, count: N + 1)
    
    resultArray[1] = 1
    if N > 1 {
        resultArray[2] = 3
    }
    
    if N == 1 {
        print(N)
        return
    } else if N == 2 {
        print(3)
        return
    }
    
    for i in 3...N {
        // the number of filling up 2* N-1 tiles and one 2*1 tile at the last
        // the number of filling up 2* N-2 tiles and (two 1*2 tiles or one 2*2 tile) at the last
        resultArray[i] = resultArray[i - 1] + resultArray[i - 2] * 2
    }
    
    print(resultArray[N])
}
