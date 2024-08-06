//
//  42-TrappingRainWater.swift
//
//
//  Created by Eric on 2024/7/17.
//

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 Example 1:

 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 */

import Foundation
import XCTest

private class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var leftMax = height[left]
        var rightMax = height[right]
        var trappedWater = 0

        while left < right {
            if height[left] < height[right] {
                leftMax = max(leftMax, height[left])
                trappedWater += leftMax - height[left]
                left += 1
            } else {
                rightMax = max(rightMax, height[right])
                trappedWater += rightMax - height[right]
                right -= 1
            }
        }
        return trappedWater
    }
}

class TrappingRainWater:XCTestCase {
    func testcase1() {
        let ans = Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])
        print(ans)
    }
}
