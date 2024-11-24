//
//  FocusFlowApp.swift
//  FocusFlow
//
//  Created by Yuri Cernov on 16/11/2024.
//

import FirebaseCore
import SwiftUI

@main
struct FocusFlowApp: App {
    
    init() { FirebaseApp.configure() }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
