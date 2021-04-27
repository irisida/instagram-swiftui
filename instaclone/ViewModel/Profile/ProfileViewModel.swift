//
//  ProfileViewModel.swift
//  instaclone
//
//  Created by ed on 27/04/2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        print("DEBUG::: follow was pressed")
    }
    
    func unfollow() {
        print("DEBUG::: unfollow was pressed")
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
