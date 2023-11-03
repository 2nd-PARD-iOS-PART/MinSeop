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
            MovieModel(title: "Previews", image: "image2"),
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
            MovieModel(title: "My List", image: "set2"),
            MovieModel(title: "My List", image: "set2"),
            MovieModel(title: "My List", image: "set3"),
            MovieModel(title: "My List", image: "set4")
        ],
        [
            MovieModel(title: "Europe movie", image: "set3"),
            MovieModel(title: "Europe movie", image: "set2"),
            MovieModel(title: "Europe movie", image: "set3"),
            MovieModel(title: "Europe movie", image: "set4")
        ],
        [
            MovieModel(title: "Romace/Drama", image: "set4"),
            MovieModel(title: "Romace/Drama", image: "set3"),
            MovieModel(title: "Romace/Drama", image: "set3"),
            MovieModel(title: "Romace/Drama", image: "set4")
        ],
        [
            MovieModel(title: "Action/Thriller", image: "set2"),
            MovieModel(title: "Action/Thriller", image: "set2"),
            MovieModel(title: "Action/Thriller", image: "set3"),
            MovieModel(title: "Action/Thriller", image: "set4")
        ],
    ]
}
#endif
