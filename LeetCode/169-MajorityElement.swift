//
//  File.swift
//  
//
//  Created by Eric on 2024/7/1.
//

/*

 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2
 
 */

import Foundation
import XCTest

private class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var element = nums[0]
        var count = 0

        for indx in 0..<nums.count {
            if count == 0 {
                element = nums[indx]
                count = 1
            }else{
                if element == nums[indx]{
                    count += 1
                }else{
                    count -= 1
                }
            }
        }
        return element
    }
}

