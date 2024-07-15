//
//  File.swift
//  
//
//  Created by Eric on 2024/6/24.
//

/*
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

 Merge nums1 and nums2 into a single array sorted in non-decreasing order.

 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 
 */

import Foundation
import XCTest

private class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int]{
        var i = m - 1 // Index for nums1
        var j = n - 1 // Index for nums2
        var k = m + n - 1 // Index for inserting into nums1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
        return nums1
    }
}

class TsetMergeSortedArray:XCTestCase {
    func test_case1() {
        let sol = Solution()
        var nums1 = [1,2,3,0,0,0]
        XCTAssertEqual(sol.merge(&nums1, 3, [2,5,6], 3), [1,2,2,3,5,6])
    }
    
    func test_case2() {
        let sol = Solution()
        var nums1 = [2,0]
        XCTAssertEqual(sol.merge(&nums1, 1, [1], 1), [1,2])
    }
}

