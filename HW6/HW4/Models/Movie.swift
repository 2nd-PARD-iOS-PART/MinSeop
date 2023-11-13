//
//  Movie.swift
//  HW4
//
//  Created by 김민섭 on 2023/11/13.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var title = ""
    @objc dynamic var descriptionText = ""
    @objc dynamic var imageData: Data? = nil // 이미지는 Data 타입으로 저장
}
