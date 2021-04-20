//
//  PrettyNumber.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/19.
//
//  6. Pretty Number

import Foundation

func prettyNumberPrimitive() {
    let N = Int(readLine()!)!
    
    let nextDegitNumbers: [[Int]] = [[1], [0, 2], [1, 3], [2, 4], [3, 5], [4, 6], [5, 7], [6, 8], [7, 9], [8]]
    var resultArray: [[Int]] = Array(repeating: [], count: N + 1)
    
    resultArray[1] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    if N == 1 {
        print(resultArray[1].count)
        return
    }
    
    for i in 2...N {
        for num in resultArray[i - 1] {
            resultArray[i].append(contentsOf: nextDegitNumbers[num])
        }
    }
    
    // timeout if N is large
    print(resultArray[N].count)
}

// O(n)
func prettyNumber() {
    let N = Int(readLine()!)!
    
    var resultArray: [[Int]] = [[Int]] (repeating: [Int](repeating: 0, count: 10), count: N + 1)
    
    for i in 1...9 {
        resultArray[1][i] = 1
    }
    
    if N < 2 {
        print(9)
        return
    }
    
    for i in 2...N {
        for j in 0...9 {
            resultArray[i][j] = 0
            if j >= 1 {
                resultArray[i][j] += resultArray[i - 1][j - 1]
            }
            if j <= 8 {
                resultArray[i][j] += resultArray[i - 1][j + 1]
            }
        }
    }
    
    var ans = 0
    for i in 0...9 {
        ans += resultArray[N][i]
    }

    print(ans)
}
