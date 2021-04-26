//
//  UserCell.swift
//  instaclone
//
//  Created by ed on 22/04/2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            // Image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                Text(user.userName).font(.system(size: 14, weight: .semibold))
                Text(user.fullName).font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}
