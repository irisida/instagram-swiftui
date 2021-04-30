//
//  NotificationsViewModel.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotifications() {
        
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String:Any] = ["timestamp": Timestamp(date: Date()),
                                  "userName": user.userName,
                                  "uid": user.id ?? "",
                                  "profileImageUrl":user.profileImageUrl,
                                  "type": type.rawValue]
        
        // add post to data if a post object is passed in.
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS
            .document(uid)
            .collection("user-notifications")
            .addDocument(data: data)
        
    }
}
