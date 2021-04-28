//
//  ProfileViewModel.swift
//  instaclone
//
//  Created by ed on 27/04/2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        print("DEBUG::: follow was pressed")
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            print("successfully followed \(self.user.userName)")
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        print("DEBUG::: unfollow was pressed")
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
