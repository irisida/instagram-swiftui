//
//  NotificationsCell.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI

struct NotificationsCell: View {
    @State private var showPostImage = true
    
    var body: some View {
        
        HStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text("Batman").font(.system(size: 14,
                                        weight: .semibold)) +
                Text(" Liked your post").font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 44, maxHeight: 44)
                    .clipped()
            } else {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}

struct NotificationsCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsCell()
    }
}
