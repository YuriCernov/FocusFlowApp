//
//  FocusFlowItemView.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import SwiftUI

struct FocusFlowItemView: View {
    
    @StateObject var viewModel = FocusFlowItemViewViewModel()
    
    let item: FocusFlowItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)

                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button { viewModel.toggleIsDone(item: item) }
            label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(DoneButtonColor)
            }
        }
    }
}

#Preview {
    FocusFlowItemView(item: .init(
        id: "123",
        title: "Get milk",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
