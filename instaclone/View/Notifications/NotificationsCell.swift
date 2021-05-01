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
    
    let notification: Notification
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text(notification.userName).font(.system(size: 14,
                                        weight: .semibold)) +
                Text(notification.type.notificationMessage).font(.system(size: 15))
            
            Spacer()
            
            if notification.type != .follow {
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

//struct NotificationsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsCell(notification: <#Notification#>)
//    }
//}
