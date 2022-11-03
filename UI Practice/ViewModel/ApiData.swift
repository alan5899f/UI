//
//  User.swift
//  UI Practice
//
//  Created by 陳韋綸 on 2022/11/3.
//

import Foundation

struct ApiData: Codable {
    let data: Datas
}

struct Datas: Codable {
    let totalCount: Int
    let items: [Item]
}

struct Item: Codable {
    let user: User
    let tags: [String]
}

struct User: Codable {
    let nickName: String
    let imageUrl: String
}
