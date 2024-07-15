//
//  File.swift
//  
//
//  Created by Eric on 2024/7/1.
//

/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

 */

import Foundation
import XCTest

private class Solution {
    // lowest point to buy and highest to sell
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 1 else {return 0}
        var maxProfit = 0, minPrice = prices[0]
        for idx in 0..<prices.count-1 {
            if prices[idx+1] > prices[idx] {
                maxProfit = max(maxProfit, prices[idx+1] - minPrice)
            } else {
                minPrice = min(prices[idx+1], minPrice)
            }
        }
        return maxProfit
    }
}

class TsetMaxProfit:XCTestCase {
    func test_case1() {
        let sol = Solution()
        let nums1 = [7,1,5,3,6,4]
        XCTAssertEqual(sol.maxProfit(nums1), 5)
    }
}

