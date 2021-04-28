//
//  MainTabView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture { selectedIndex = 0 }
                    .tag(0)
                    .tabItem { Image(systemName: "house") }
                
                SearchView()
                    .onTapGesture { selectedIndex = 1 }
                    .tag(1)
                    .tabItem { Image(systemName: "magnifyingglass") }
                
                UploadPostView()
                    .onTapGesture { selectedIndex = 2 }
                    .tag(2)
                    .tabItem { Image(systemName: "plus.square") }
                
                NotificationsView()
                    .onTapGesture { selectedIndex = 3 }
                    .tag(3)
                    .tabItem { Image(systemName: "heart") }
                
                ProfileView(user: user)
                    .onTapGesture { selectedIndex = 4 }
                    .tag(4)
                    .tabItem { Image(systemName: "person") }
            }
            .navigationTitle(tabTitle)
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
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Search"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}
