//
//  RegisterView.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Registration", subtitle: "Start organizing todos",
                angle: -15, background: RegisterMainColor
            )
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                FFButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }.padding()
            }.offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
