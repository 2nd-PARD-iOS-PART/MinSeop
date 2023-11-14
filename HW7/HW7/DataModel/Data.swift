//
//  Data.swift
//  HW7
//
//  Created by 김민섭 on 2023/11/14.
//

import UIKit

struct PardData : Codable {
    // 이 부분의 변수명들은 불러온 부분과 일치해야 함.
    let data : [DataList]
}

struct DataList : Codable {
    let name : String
    let age : Int
    let part : String
    let imgURL : String
}
