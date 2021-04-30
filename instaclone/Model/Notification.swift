//
//  Notification.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import FirebaseFirestoreSwift
import Firebase

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked your post."
        case .comment: return " commented on one of your posts"
        case .follow: return " is now following you"
        }
    }
}


struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let userName: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
    
}
