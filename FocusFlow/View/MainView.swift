//
//  ContentView.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else { LoginView() }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            FocusFlowView(userId: viewModel.currentUserId)
                .tabItem { Label("Home", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
