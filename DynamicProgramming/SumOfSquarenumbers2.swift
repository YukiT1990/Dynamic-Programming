//
//  SumOfSquarenumbers2.swift
//  DynamicProgramming
//
//  Created by Yuki Tsukada on 2021/04/20.
//
//  10. Sum of Square numbers - 2

import Foundation

func sumOfSquareNumbers() {
    let N = Int(readLine()!)!
    
    var terms: [Int] = Array(repeating: 0, count: N + 1)
    
    terms[1] = 1
    if N < 2 {
        print(N)
    }
    
    let rootN: Int = Int(Double(N).squareRoot())
    
    for i in 2...N {
        var j = 1
        var termsArray: [Int] = []
        while j <= rootN && j*j <= i {
            let tempTerms = terms[i - j*j] + 1
            termsArray.append(tempTerms)
            j += 1
        }
        terms[i] = termsArray.min()!
    }
    
    print(terms[N])
}
