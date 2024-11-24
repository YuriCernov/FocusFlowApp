//
//  FocusFlowItemsView.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import FirebaseFirestore
import SwiftUI

struct FocusFlowView: View {
    
    @StateObject var viewModel: FocusFlowViewViewModel
    @FirestoreQuery var items: [FocusFlowItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: FocusFlowViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    FocusFlowItemView(item: item)
                        .swipeActions {
                            Button("Delete") { viewModel.delete(id: item.id) }
                                .tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("To Do List")
            
            .toolbar {
                Button { viewModel.isNewItemViewPresented = true }
                label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isNewItemViewPresented) {
                NewItemView(newItemPresented: $viewModel.isNewItemViewPresented)
            }
        }
    }
}

#Preview {
    FocusFlowView(userId: "9wa3vAL81ShILRvgGJaE4aaTP4o1")
}
 
