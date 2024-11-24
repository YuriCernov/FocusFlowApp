//
//  FFButton.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import SwiftUI

struct FFButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button { action() }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    FFButton(title: "Value", background: .pink) { }
}
