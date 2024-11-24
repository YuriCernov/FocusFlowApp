//
//  FocusFlowViewViewModel.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import FirebaseFirestore
import Foundation

class FocusFlowViewViewModel: ObservableObject {
    
    @Published var isNewItemViewPresented = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete focus flow item (to do item)
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let database = Firestore.firestore()
        database.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
