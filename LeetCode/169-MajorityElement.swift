//
//  File.swift
//  
//
//  Created by Eric on 2024/7/1.
//

/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

  

 Example 1:

 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:

 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]

 */

import Foundation
import XCTest

private class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let len = nums.count, origin_nums = nums
        for idx in 0..<len {
            let newIdx = (idx + k) % len
            nums[newIdx] = origin_nums[idx]
        }
    }
    
    func rotate2(_ nums: inout [Int], _ k :Int) {
        guard nums.count > 1 else {return}
        let ramainer = k % nums.count
        let k = ramainer > 0 ? ramainer : k
        nums = nums.suffix(k) + nums.prefix(nums.count - k)
    }
}

class TsetRotateArray:XCTestCase {
    func test_case1() {
        var nums1 = [1,2,3,4,5,6]
        Solution().rotate(&nums1, 3)
        print(nums1)
        XCTAssertEqual(nums1, [4,5,6,1,2,3])
    }
    
}

