//
//  instacloneApp.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI
import Firebase

@main
struct instacloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            // create the ContentView as the rootController
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
