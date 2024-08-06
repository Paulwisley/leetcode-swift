//
//  File.swift
//  
//
//  Created by Eric on 2024/7/24.
//

/*
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  

 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false
 */

import Foundation
import XCTest

private class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var isSubsequence = true
        let sLen = s.count, tLen = t.count
        guard sLen <= tLen else {
            return false
        }
        
        return isSubsequence
    }
}

class TestIsSubsequence:XCTestCase {
    func testCase1() {
        
    }
}
