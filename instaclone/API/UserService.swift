//
//  UserService.swift
//  instaclone
//
//  Created by ed on 27/04/2021.
//

import Firebase

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        // updates the current user
        // to a state of following
        // the selected user
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { _ in
                // upates the selected users
                // followers list to add
                // the current user
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid).delete { _ in
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument { snapshot, _ in
                // Gets a boolean value to return for the
                // existence of the user.id in the list of
                // users being folowed by the current user
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
}
