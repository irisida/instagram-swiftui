//
//  User.swift
//  instaclone
//
//  Created by ed on 26/04/2021.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName: String
    let fullName: String
    let email: String
    let profileImageUrl: String
    var isFollowed: Bool? = false
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    var stats: UserStats?
    var bio: String?
    
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
