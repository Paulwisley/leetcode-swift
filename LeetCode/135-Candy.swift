//
//  File.swift
//  
//
//  Created by Eric on 2024/7/13.
//


/*
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.

  

 Example 1:

 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 */
import Foundation
import XCTest

private class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var candies = ratings.count
        if candies < 2 { return candies }
        var assigned = Array(repeating: 1, count: candies)
        var reversed = 1
        for idx in 1..<ratings.count {
            if ratings[idx] < ratings[idx-1] {
                reversed += 1
            }
        }
        while reversed > 0 {
            for idx in 1..<ratings.count {
                if ratings[idx-1] > ratings[idx] {
                    if assigned[idx-1] > assigned[idx] {
                        continue
                    } else {
                        assigned[idx-1] = assigned[idx] + 1
                    }
                } else if ratings[idx-1] < ratings[idx] {
                    if assigned[idx-1] < assigned[idx] {
                        continue
                    } else {
                        assigned[idx] = assigned[idx-1] + 1
                    }
                }
            }
            reversed -= 1
        }
        return assigned.reduce(0, {$0+$1})
    }
}

private class Solution2 {
    func candy(_ ratings: [Int]) -> Int {
        let len = ratings.count
        guard len > 1 else { return len }
        
        var value = 0
        
        var lhs2rhs = [Int](repeating: 1, count: len)
        var rhs2lhs = [Int](repeating: 1, count: len)
        
        for i in 1..<len where ratings[i] > ratings[i - 1] {
            lhs2rhs[i] = lhs2rhs[i - 1] + 1
        }
        for i in (0..<(len - 1)).reversed() where ratings[i] > ratings[i + 1] {
            rhs2lhs[i] = rhs2lhs[ i + 1] + 1
        }
        for i in 0..<len {
            value += max(lhs2rhs[i], rhs2lhs[i])
        }
        return value
    }
}


class TestCandy:XCTestCase {
    func testCase1() {
        let ans = Solution().candy([1,0,2])
        XCTAssert(ans == 5)
    }
}
