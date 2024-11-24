//
//  User.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
