//
//  User.swift
//  instaclone
//
//  Created by ed on 26/04/2021.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let userName: String
    let fullName: String
    let email: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}
