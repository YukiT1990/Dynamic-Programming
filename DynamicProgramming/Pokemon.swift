//
//  Pokemon.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/20.
//
//  11. Pokemon

import Foundation

func pokemon() {
    let firstLine = readLine()!.split(separator: " ").map { Int($0) }
    
    let numOfColumns = firstLine[0]!
    let numOfRows = firstLine[1]!
    
    var inputMatrix: [[Int]] = [[Int]] (repeating: [Int](repeating: 0, count: numOfRows), count: numOfColumns)
    
    var resultMatrix: [[Int]] = [[Int]] (repeating: [Int](repeating: 0, count: numOfRows), count: numOfColumns)
    
    for i in 0..<numOfColumns {
        inputMatrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    resultMatrix[0][0] = inputMatrix[0][0]
    
    for c in 0..<numOfColumns {
        for r in 0..<numOfRows {
            if c != 0 && r != 0 {
                resultMatrix[c][r] = [resultMatrix[c - 1][r], resultMatrix[c][r - 1]].max()! + inputMatrix[c][r]
            } else if c != 0 {
                resultMatrix[c][r] = resultMatrix[c - 1][r] + inputMatrix[c][r]
            } else if r != 0 {
                resultMatrix[c][r] = resultMatrix[c][r - 1] + inputMatrix[c][r]
            }
        }
    }
    
    print(resultMatrix[numOfColumns - 1][numOfRows - 1])
}
