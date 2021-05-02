//
//  Comment.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    var timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
