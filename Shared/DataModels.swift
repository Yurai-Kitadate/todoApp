//
//  DataModels.swift
//  todoApp
//
//  Created by yurai on 2022/04/29.
//

import Foundation
struct Content: Identifiable {
    var id: Int
    var title: String
    var updatedAt : String
    var description : String
}
struct User {
    var name: String
}
