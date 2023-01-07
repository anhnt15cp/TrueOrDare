//
//  GameWordResponse.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation


// Bắt đầu
struct StartUp: Codable {
    let easy: [ListItemEasy]
}

struct ListItemEasy: Codable {
    let stt: Int?
    let cau: String?
    let image: String?
}

// Khởi động
struct Acceleration: Codable {
    let medium: [ListItemMedium]
}

struct ListItemMedium: Codable {
    let stt: Int?
    let cau: String?
    let image: String?
}

// Về đích
struct Finish: Codable {
    let hard: [ListItemHard]
}

struct ListItemHard: Codable {
    let stt: Int?
    let cau: String?
    let image: String?
}
