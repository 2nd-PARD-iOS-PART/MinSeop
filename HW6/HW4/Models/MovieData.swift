//
//  MovieData.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/15.
//

import Foundation

struct MovieData {
    var title: String
    var image: String
}

#if DEBUG

extension MovieData {
    static var MovieModelData = [
        MovieData(title: "남과여", image: "남과여"),
        MovieData(title: "히말라야", image: "히말라야"),
        MovieData(title: "무뢰한", image: "무뢰한"),
        MovieData(title: "비념", image: "비념"),
        MovieData(title: "동주", image: "동주"),
        MovieData(title: "그들은 죽었다", image: "그들은 죽었다"),
        MovieData(title: "기묘한 이야기", image: "image1"),
        MovieData(title: "라라랜드", image: "라라랜드"),
        MovieData(title: "1917", image: "1917")
    ]
}

#endif
