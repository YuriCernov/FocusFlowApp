//
//  LoginView.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "Focus Flow", subtitle: "Get things done",
                    angle: 24, background: LogInMainColor
                )
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    FFButton(title: "Log In", background: LogInButtonColor) {
                        viewModel.login()
                    }.padding()
                }.offset(y: -50)
                
                VStack {
                    Text("New around here?")

                    NavigationLink("Create an Account", destination: RegisterView())
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
