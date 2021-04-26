//
//  ProfileHeaderView.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 3, title: "Following")
                }.padding(.trailing, 32)
            }
            
            Text(user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight | Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 2)
            
            HStack {
                Spacer()
                ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
                Spacer()
            }.padding(.top)
        }
    }
}


