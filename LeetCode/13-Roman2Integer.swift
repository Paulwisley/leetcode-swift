//
//  13-Roman2Integer.swift
//
//
//  Created by Eric on 2024/7/17.
//
/*
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.

 

Example 1:

Input: s = "III"
Output: 3
Explanation: III = 3.
*/

import Foundation
import XCTest

private class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanDict = ["I": 1,
                         "V": 5,
                         "X": 10,
                         "L": 50,
                         "C": 100,
                         "D": 500,
                         "M": 1000,
                         "IV": 4,
                         "IX": 9,
                         "XL": 40,
                         "XC": 90,
                         "CD": 400,
                         "CM": 900
                         ]
        var curNum = 0
        if s.count == 1 {
            return romanDict[s] ?? 0
        }
        var arrS = s.map({String($0)})
        arrS.append("0")
        var idx = 0
        while idx < arrS.count {
            let is4to9: Bool = arrS[idx] == "I" && (arrS[idx+1] == "V" || arrS[idx+1] == "X")
            let is40to90: Bool = arrS[idx] == "X" && (arrS[idx+1] == "L" || arrS[idx+1] == "C")
            let is400to900: Bool = arrS[idx] == "C" && (arrS[idx+1] == "D" || arrS[idx+1] == "M")
            if is4to9 || is40to90 || is400to900 {
                let curStr = arrS[idx] + arrS[idx+1]
                curNum += romanDict[curStr] ?? 0
                idx += 2
            } else {
                curNum += romanDict[arrS[idx]] ?? 0
                idx += 1
            }
        }
        
        return curNum
    }
}

class TestRomanToInt: XCTestCase {
    func testCase1() {
        let ans = Solution().romanToInt("MCMXCIV")
        print(ans)
        XCTAssertTrue(ans == 1994)
    }
}
