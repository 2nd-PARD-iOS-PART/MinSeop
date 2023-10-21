//
//  Model.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/15.
//

import Foundation


struct MovieModel{
    var title : String
    var image : String
}

#if DEBUG

extension MovieModel{
    static var ModelData = [
        [
            MovieModel(title: "Previews", image: "set1"),
            MovieModel(title: "Previews", image: "set2"),
            MovieModel(title: "Previews", image: "set3"),
            MovieModel(title: "Previews", image: "set4")
        ],
        [
            MovieModel(title: "Continue Watching for MinSeop Kim", image: "set1"),
            MovieModel(title: "Continue Watching for MinSeop Kim", image: "set2"),
            MovieModel(title: "Continue Watching for MinSeop Kim", image: "set3"),
            MovieModel(title: "Continue Watching for MinSeop Kim", image: "set4")
        ],
        [
            MovieModel(title: "My List", image: ""),
            MovieModel(title: "My List", image: ""),
            MovieModel(title: "My List", image: ""),
            MovieModel(title: "My List", image: ""),
            MovieModel(title: "My List", image: ""),
            MovieModel(title: "My List", image: ""),
        ],
        [
            MovieModel(title: "Europe movie", image: ""),
            MovieModel(title: "Europe movie", image: ""),
            MovieModel(title: "Europe movie", image: ""),
            MovieModel(title: "Europe movie", image: ""),
            MovieModel(title: "Europe movie", image: ""),
            MovieModel(title: "Europe movie", image: ""),
        ],
        [
            MovieModel(title: "Romace/Drama", image: ""),
            MovieModel(title: "Romace/Drama", image: ""),
            MovieModel(title: "Romace/Drama", image: ""),
            MovieModel(title: "Romace/Drama", image: ""),
            MovieModel(title: "Romace/Drama", image: ""),
            MovieModel(title: "Romace/Drama", image: ""),
        ],
        [
            MovieModel(title: "Action/Thriller", image: ""),
            MovieModel(title: "Action/Thriller", image: ""),
            MovieModel(title: "Action/Thriller", image: ""),
            MovieModel(title: "Action/Thriller", image: ""),
            MovieModel(title: "Action/Thriller", image: ""),
            MovieModel(title: "Action/Thriller", image: ""),

        ],
    ]
}
#endif
