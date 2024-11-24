//
//  FocusFlowItemViewViewModel.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class FocusFlowItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: FocusFlowItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let database = Firestore.firestore()
        database.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}

