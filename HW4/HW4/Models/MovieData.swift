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
    var videoURL: String // 비디오 URL을 저장할 속성 추가
}

#if DEBUG

extension MovieData {
    static var MovieModelData = [
        MovieData(title: "남과여", image: "남과여", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "히말라야", image: "히말라야", videoURL: "https://www.youtube.com/watch?v=Rq4ROK57v_c"),
        MovieData(title: "무뢰한", image: "무뢰한", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "비념", image: "비념", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "동주", image: "동주", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "그들은 죽었다", image: "그들은 죽었다", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "기묘한 이야기", image: "image1", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "라라랜드", image: "라라랜드", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4"),
        MovieData(title: "1917", image: "1917", videoURL: "https://www.youtube.com/watch?v=W7edvITC9g4")
    ]
}

#endif
