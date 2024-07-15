//
//  File.swift
//  
//
//  Created by Eric on 2024/7/3.
//

/*
 274. H-Index
 Medium
 Topics
 Companies
 Hint
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.

 Example 1:

 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 Example 2:

 Input: citations = [1,3,1]
 Output: 1
 */

/*第一次看到这个概念比较难理解，看一下 维基百科) 的定义。
H指数的计算基于其研究者的论文数量及其论文被引用的次数。赫希认为：一个人在其所有学术文章中有N篇论文分别被引用了至少N次，他的H指数就是N。如美国耶鲁大学免疫学家理查德·弗来沃发表的900篇文章中，有107篇被引用了107次以上，他的H指数是107。

可以按照如下方法确定某人的H指数：
将其发表的所有SCI论文按被引次数从高到低排序；
从前往后查找排序后的列表，直到某篇论文的序号大于该论文被引次数。所得序号减一即为H指数。
*/

import Foundation
import XCTest

private class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        guard !citations.isEmpty else {return 0}
        let sortedCitations = Array(citations.sorted().reversed())
        print(sortedCitations)
        var index = 1
        for citation in sortedCitations {
            if index > citation {
                break
            } else {
                index += 1
            }
        }
        return index - 1
    }
}
