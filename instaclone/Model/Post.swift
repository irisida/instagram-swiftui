//
//  Post.swift
//  instaclone
//
//  Created by ed on 28/04/2021.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let ownerImageUrl: String
    let timestamp: Timestamp
    
    var didLike: Bool? = false
}
