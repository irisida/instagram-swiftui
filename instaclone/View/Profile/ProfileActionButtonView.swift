//
//  ProfileActionButtonView.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed = false
    
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button for current user
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1.0 ))
                    
            })
        } else {
            // follow and message button
            HStack {
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }, label: {
                    Text(isFollowed ? "Unfollow" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0 ))
                        
                }).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: 1.0 ))
                        
                }).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
