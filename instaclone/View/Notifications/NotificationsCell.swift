//
//  NotificationsCell.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI
import Kingfisher

struct NotificationsCell: View {
    @State private var showPostImage = true
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var body: some View {
        
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            
            Text(viewModel.notification.userName)
                .font(.system(size: 14,weight: .semibold)) +
                Text(viewModel.notification.type.notificationMessage)
                .font(.system(size: 15)) +
                Text(" \(viewModel.timestampString)")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: Feedcell(viewModel: FeedCellViewModel(post: post))) {
                        
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width:40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Unfollow" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: isFollowed ? 1.0 : 0 ))
                })
            }
        }.padding(.horizontal)
    }
}

//struct NotificationsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsCell(notification: <#Notification#>)
//    }
//}
