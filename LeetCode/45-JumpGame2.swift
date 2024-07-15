//
//  File.swift
//  
//
//  Created by Eric on 2024/7/2.
//

/*
 You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

 Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:

 0 <= j <= nums[i] and
 i + j < n
 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

  

 Example 1:

 Input: nums = [2,3,1,0,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [2,3,0,1,4]
 Output: 2
 */

import Foundation
import XCTest

private class Solution {
    func jump(_ nums: [Int]) -> Int {
        let len = nums.count
        guard len > 1 else {
            return 0
        }

        var jumps:[Int] = Array(repeating: 0, count: len)
        for idx in (0..<len-1).reversed() {
            if nums[idx] == 0 {
                jumps[idx] = 99999
                continue
            }
            let endIndex = nums[idx] + idx
            if endIndex < len {
                jumps[idx] = (Array(jumps[idx+1...endIndex]).min() ?? 0) + 1
            } else {
                jumps[idx] = 1
            }
        }
        return jumps[0]
    }
    
    func jump2(_ nums: [Int]) -> Int {
        guard 1 <= nums.count && nums.count <= Int(10e4) else { return 0 }
        var step = 0, end = 0, maxPos = 0
        for i in 0..<nums.count - 1 {
            maxPos = max(maxPos, i + nums[i])
            if i == end {
                end = maxPos
                step += 1
            }
        }
        return step
    }
}

class TestJumpGame2:XCTestCase {
    func testCase1() {
        let sol = Solution()
        let ans1 = sol.jump2([5,9,3,2,1,0,2,3,3,1,0,0])
    }
}
