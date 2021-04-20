//
//  NonDecreasingDigits.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/20.
//
//  7. Non-decreasing Digits

import Foundation

func nonDescendingDigitsPrimitive() {
    let N = Int(readLine()!)!
    
    let nextDegitNumbers: [[Int]] = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [2, 3, 4, 5, 6, 7, 8, 9], [3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9], [5, 6, 7, 8, 9], [6, 7, 8, 9], [7, 8, 9], [8, 9], [9]]
    
    var resultArray: [[Int]] = Array(repeating: [], count: N + 1)
    
    resultArray[1] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
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
func nonDescendingDigits() {
    let N = Int(readLine()!)!
    
    var resultArray: [[Int]] = [[Int]] (repeating: [Int](repeating: 0, count: 10), count: N + 1)
    
    for i in 0...9 {
        resultArray[1][i] = 1
    }
    
    if N < 2 {
        print(10)
        return
    }
    
    for i in 2...N {
        for j in 0...9 {
            for k in 0...j {
                resultArray[i][j] += resultArray[i - 1][k]
            }
        }
    }
    
    var ans = 0
    for i in 0...9 {
        ans += resultArray[N][i]
    }

    print(ans)
}
