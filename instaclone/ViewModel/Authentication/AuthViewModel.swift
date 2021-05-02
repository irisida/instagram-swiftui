//
//  AuthViewModel.swift
//  instaclone
//
//  Created by ed on 25/04/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendReset: Bool = false
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG::: login failed. \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signUp(withEmail email: String, password: String, image: UIImage?, fullName: String, userName: String) {
        
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG::: create user failed. \(error.localizedDescription)")
                    return
                }
                
                // create the user constant.
                guard let user = result?.user else { return }
                
                let data = ["email": email,
                            "userName": userName,
                            "fullName": fullName,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("LOGINFO::: failed to send reset link. \(error.localizedDescription)")
                return
            }
            
            self.didSendReset = true
            print("LOGINFO::: Successfully sent reset link.")
        }
    }
    
    
}
