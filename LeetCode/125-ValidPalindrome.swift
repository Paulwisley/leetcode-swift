//
//  125-ValidPalindrome.swift
//
//
//  Created by Eric on 2024/7/15.
//

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

  

 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 */

import Foundation
import XCTest
import CSAlgorithm

private class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        let lowerStr = Array(s.lowercased()).filter { $0.isNumber || $0.isLetter }
        let end = lowerStr.count - 1
        for idx in 0..<lowerStr.count/2 {
            if lowerStr[idx] == lowerStr[end - idx] {
                continue
            } else {
                return false
            }
        }
        return true
    }
}


class TestPalindrome:XCTestCase {
    func testCase1() {
        let s = " "
        let result = Solution().isPalindrome(s)
        XCTAssertTrue(result)
    }
    
    func testVisitTime() {
        let str = "A man, a plan, a canal: Panama".lowercased()
        let strArray = Array(str.filter({$0.isLetter || $0.isNumber}))
        let clock = ContinuousClock()
        let indexWay = clock.measure {
            let index = str.index(str.startIndex, offsetBy: 4)
            let _ = str[index]
        }
        let arrayWay = clock.measure {
            let _ = strArray[4]
        }
        print("index: ", indexWay*1000, "array:", arrayWay*1000, "index/array:", indexWay/arrayWay)
    }
}
