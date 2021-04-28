//
//  Feedcell.swift
//  instaclone
//
//  Created by ed on 21/04/2021.
//

import SwiftUI
import Kingfisher

struct Feedcell: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440 )
                .clipped()
            
            // action buttons
            HStack (spacing: 16) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .padding(4)
                })
            }.foregroundColor(.black).padding(.leading, 4)
            
            // engagement
            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
            // caption
            HStack {
                Text(post.ownerUsername).font(.system(size: 14,
                                            weight: .semibold)) +
                    Text(" \(post.caption)").font(.system(size: 15))
                
            }.padding(.horizontal, 8)
            
            Text("\(post.timestamp.dateValue())")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
        }
    }
}

//struct Feedcell_Previews: PreviewProvider {
//    static var previews: some View {
//        Feedcell()
//    }
//}
