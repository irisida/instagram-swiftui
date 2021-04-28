//
//  ContentView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        
        // create a group within which we can determine
        // if a user is logged-in based on the value of
        // userSession in the viewModel.
        // Where a user is not found to be logged in on
        // a given device or sim then we will then show
        // the LoginView()
        // Where we have a logged in user then we will
        // show the MainTabView()
        
        Group  {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

