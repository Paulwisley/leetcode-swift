//
//  File.swift
//  
//
//  Created by Eric on 2024/7/11.
//

/*
 Implement the RandomizedSet class:

 RandomizedSet() Initializes the RandomizedSet object.
 bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
 bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
 int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
 You must implement the functions of the class such that each function works in average O(1) time complexity.
 */

import Foundation
import XCTest

private class RandomizedSet {
    private var dict: [Int: Int] // element: Index
    private var nums: [Int] // 存真实元素
    
    init() {
        dict = [Int: Int]()
        nums = [Int]()
    }
    
    func insert(_ val: Int) -> Bool {
        if dict[val] != nil {
            return false
        }
        dict[val] = nums.count
        nums.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = dict[val] else { return false }
        let lastNum = nums[nums.count - 1]
        nums[index] = lastNum
        dict[lastNum] = index
        nums.removeLast()
        dict[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        let index = Int.random(in: 0..<nums.count)
        return nums[index]
    }
}
