//
//  MainTabView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem { Image(systemName: "house") }
                
                SearchView()
                    .tabItem { Image(systemName: "magnifyingglass") }
                
                UploadPostView()
                    .tabItem { Image(systemName: "plus.square") }
                
                NotificationsView()
                    .tabItem { Image(systemName: "heart") }
                
                ProfileView(user: user)
                    .tabItem { Image(systemName: "person") }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("logout").foregroundColor(.black)
        }
    }
}
