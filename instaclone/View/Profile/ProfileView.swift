//
//  ProfileView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                //PostGridView(viewModel: viewModel)
            }.padding(.top)
        }
    }
}
