//
//  FocusFlowItem.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import Foundation

struct FocusFlowItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) { isDone = state }
}
