//
//  55-JumpGame.swift
//  CSAlgorithm
//
//  Created by Eric on 2024/7/2.
//

/*
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

 */
import Foundation
import XCTest

private class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count >= 1 else {
            return false
        }
        var maxCanJumpIndex = nums.count-1
        for idx in stride(from: nums.count-1, through: 0, by: -1) {
            let curJump = idx + nums[idx]
            if curJump >= maxCanJumpIndex {
                maxCanJumpIndex = idx
            } else {
                if idx == 0 {
                    return false
                } else {
                    continue
                }
            }
        }
        return true
    }
    
    func  canJump2(_ nums: [Int]) -> Bool {
        guard nums.count >= 1 else {
            return false
        }
        var reach = 0
        for idx in 0..<nums.count {
            // 不可达 or 已到达终点
            if idx > reach || reach >= nums.count - 1 {
                break
            }
            reach = max(reach, idx + nums[idx])
        }
        return reach >= nums.count - 1
    }
}

class TestJumpGame:XCTestCase {
    func testJumpGame() {
        let sol = Solution()
        let result = sol.canJump2([2,0,0])
        XCTAssertTrue(result)
    }
}
