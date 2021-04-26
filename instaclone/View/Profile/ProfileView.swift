//
//  ProfileView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }.padding(.top)
        }
    }
}
