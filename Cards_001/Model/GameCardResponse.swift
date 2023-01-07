//
//  GameCardResponse.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation

struct ItemTet: Codable {
    let tet: [ListItemTet]
}

struct ListItemTet: Codable {
    let stt: Int?
    let cau: String?
    let image: String?
    let music: String?
}

struct ItemNhau: Codable {
    let nhau: [ListItemNhau]
}

struct ListItemNhau: Codable {
    let stt: Int?
    let cau: String?
    let image: String?
    let music: String?
}
