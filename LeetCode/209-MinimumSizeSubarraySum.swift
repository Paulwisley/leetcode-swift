//
//  209-MinimumSizeSubarraySum.swift
//
//
//  Created by Eric on 2024/7/15.
//

/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a
 subarray
 whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

  

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:

 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:

 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 */
import Foundation
import XCTest

private class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var current = 0
        var solution = Int.max

        for (index, element) in nums.enumerated() {
            current += element

            while current >= target {
                solution = min(solution, (index - left + 1))
                current -= nums[left]
                left += 1
            }
        }

        return solution == Int.max ? 0 : solution
    }
}

class TestMinSubArrayLen:XCTestCase {
    func testCase1() {
        let ans1 = Solution().minSubArrayLen(213, [12,28,83,4,25,26,25,2,25,25,25,12])
        let ans2 = Solution().minSubArrayLen(4, [1,4,4])
        let ans3 =  Solution().minSubArrayLen(7, [2,3,1,2,4,3])
        print(ans1, ans2, ans3)
        XCTAssert(ans1 == 8)
        XCTAssert(ans2 == 1)
        XCTAssert(ans3 == 2)
    }
}
