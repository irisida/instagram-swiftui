//
//  EdirProfileViewModel.swift
//  instaclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var uploadComplete = false
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func saveProfileData(userBio: String) {
        
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": userBio]) { _ in
            self.user.bio = userBio
            self.uploadComplete = true
        }
    }
}
