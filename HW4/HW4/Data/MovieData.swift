//
//  MovieData.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/15.
//

import Foundation

struct MovieData {
    let images: [String]
}

#if DEBUG

extension MovieData {
    static var MovieModelData = [
        MovieData(images: ["set1, set2, set3, set4"]),
        MovieData(images: ["set1, set2, set3, set4"]),
        MovieData(images: ["set1, set2, set3, set4"]),
        MovieData(images: ["set1, set2, set3, set4"]),
        MovieData(images: ["set1, set2, set3, set4"]),
        MovieData(images: ["set1, set2, set3, set4"])
    ]
}

#endif
