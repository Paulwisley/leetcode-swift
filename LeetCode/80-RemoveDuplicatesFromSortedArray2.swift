
//
//  Created by Eric on 2024/6/28.
//
/*

 Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.

 Example 1:

 Input: nums = [1,1,1,2,2,3]
 Output: 5, nums = [1,1,2,2,3,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
*/

import Foundation
import XCTest

private class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let len = nums.count
        guard len > 2 else {return len}
        var realIdx = 1 // 真实位置
        var count = 1 // 重复个数
        for idx in 1..<len { // 遍历
            if nums[idx] == nums[idx-1] {
                count += 1
            } else {
                count = 1
            }
            if count <= 2 { // 只允许最多出现2次
                nums[realIdx] = nums[idx]
                realIdx += 1
            }
        }
        return realIdx
    }
}

class TestRemoveDuplicates2:XCTestCase {
    
    func test_case1() {
        var nums = [1,1,1,2,2,3]
        let k = Solution().removeDuplicates(&nums)
        print(k, nums)
        XCTAssertTrue(k==5)
    }
    
    func test_case2() {
        var nums = [0,0,1,1,1,1,2,3,3]
        let k = Solution().removeDuplicates(&nums)
        print(k, nums)
        XCTAssertTrue(k==7)
    }
    
}
