//
//  week409.swift
//  CSAlgorithm
//
//  Created by Eric on 04/08/2024.
//

import Foundation
import XCTest

private class Solution {
    enum ListGraphType {
        // 无向的
        case Undirected
        
        // 有向的
        case Directed
    }

    /// 邻接表结点
    class ListNode<T: Equatable & CustomStringConvertible> {
        /// 存储的数据
        var value: T
        
        /// 下一个结点
        var next: ListNode?
        
        /// 权重
        var weighted: Int
        
        /// 在顶点数组中所处的下标
        var index: Int
        
        /// 最短搜索路径中使用，表示从所求起始顶点到此顶点的最短距离
        var distance: Int
        
        init(value: T, next: ListNode? = nil, weighted: Int = 0, index: Int = -1, distance: Int = Int.max) {
            self.value = value
            self.next = next
            self.weighted = weighted
            self.index = index
            self.distance = distance
        }
    }
    
    class ListGraph<T: Equatable & CustomStringConvertible> {
        /// 存储的元素个数
        private(set) var count: Int
        
        /// 顶点数组，用来存储顶点
        private(set) var vertexArr: [ListNode<T>]
        
        /// 邻接表类型
        private let type: ListGraphType
        
        /// 深度优先搜索辅助变量
        private var found: Bool = false
        
        /// 初始化邻接表
        /// - Parameter type: 邻接表类型
        init(type: ListGraphType) {
            self.type = type
            count = 0
            vertexArr = []
        }
        
        /// 添加顶点
        /// - Parameter vertex: 顶点
        @discardableResult
        func addVertex(_ vertex: T) -> Self {
            count += 1
            vertexArr.append(ListNode(value: vertex, index: count-1))
            return self
        }
        
        /// 查找顶点对应的下标
        /// - Parameter vertex: 顶点
        private func indexOf(_ vertex: T) -> Int? {
            return vertexArr.firstIndex { $0.value == vertex }
        }
        
        /// 添加两个顶点之间的边关系
        /// - Parameters:
        ///   - form: 从哪个顶点出发
        ///   - to: 到哪个顶点
        ///   - weighted: 权重
        @discardableResult
        func addEdge(from: T, to: T, weighted: Int = 0) -> Bool {
            guard let f = indexOf(from), let t = indexOf(to), f != t else {
                return false
            }
            switch type {
            case .Directed:
                // 有向图
                let toNode = ListNode(value: to, next: vertexArr[f].next, weighted: weighted, index: t)
                vertexArr[f].next = toNode
            case .Undirected:
                // 无向图
                let toNode = ListNode(value: to, next: vertexArr[f].next, weighted: weighted, index: t)
                let fromNode = ListNode(value: from, next: vertexArr[t].next, weighted: weighted, index: f)
                vertexArr[f].next = toNode
                vertexArr[t].next = fromNode
            }
            return true
        }
        
        /// 打印图
        func print() {
            Swift.print("\(type == .Directed ? "邻接表有向图" : "邻接表无向图") =》")
            for i in 0..<count {
                Swift.print("\(vertexArr[i].value): ", terminator: "")
                var p = vertexArr[i].next
                // 没有指向的顶点
                if p == nil {
                    Swift.print("无")
                    continue
                }
                
                // 遍历顶点
                while p != nil {
                    Swift.print("-> (权重:\(p!.weighted))\(p!.value)", terminator: " ")
                    p = p?.next
                }
                Swift.print("")
            }
        }
    }
    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var ans:[Int] = Array(), nums = Array(repeating: 1, count: n)
        var curStep = 0
        for i in 0..<queries.count {
            let index = queries[i][0]
            let value = queries[i][1]
            if value - index < nums[index] {
            } else {
                nums[index] = max(value - index, nums[index])
                curStep = countHelp(nums)
            }

            ans.append(curStep)
        }
        return ans
    }
    
    func countHelp(_ nums:[Int]) -> Int {
        var step = 0, end = 0, maxPos = 0
        for i in 0..<nums.count - 1 {
            if i == end {
                maxPos = max(maxPos, i + nums[i])
                end = maxPos
                step += 1
            }
        }
        return step
    }
}

private class neighborSum {
    private var nums: [[Int]] // 存真实元素
    
    init(_ grid: [[Int]]) {
        nums = grid
    }
    
    func adjacentSum(_ value: Int) -> Int {
        var sum = 0
        for i in 0..<nums.count {
            for j in 0..<nums[i].count {
                if nums[i][j] == value {
                    var left = 0,right = 0,up = 0,down = 0
                    if i - 1 >= 0 {
                        up = nums[i-1][j]
                    }
                    if j - 1 >= 0 {
                        left = nums[i][j-1]
                    }
                    if i + 1 < nums.count {
                        down = nums[i+1][j]
                    }
                    if j + 1 < nums[i].count {
                        right = nums[i][j+1]
                    }
                    sum = up + left + down + right
                    return sum
                }
            }
        }
        return sum
    }
    
    func diagonalSum(_ value: Int) -> Int {
        var sum = 0
        for i in 0..<nums.count {
            for j in 0..<nums[i].count {
                if nums[i][j] == value {
                    var left = 0,right = 0,up = 0,down = 0
                    if i - 1 >= 0 && j - 1 >= 0{
                        up = nums[i-1][j-1]
                    }
                    if j - 1 >= 0 && i + 1 < nums.count {
                        left = nums[i+1][j-1]
                    }
                    if i + 1 < nums.count && j + 1 < nums.count {
                        down = nums[i+1][j+1]
                    }
                    if j + 1 < nums[i].count && i - 1 >= 0 {
                        right = nums[i-1][j+1]
                    }
                    sum = up + left + down + right
                    return sum
                }
            }
        }
        return sum
    }
}

class TestWeek409:XCTestCase {
}
