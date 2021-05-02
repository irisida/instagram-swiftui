//
//  CommentCell.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(comment.userName).font(.system(size: 14, weight: .semibold)) +
                Text(" \(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            Text(" \(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

