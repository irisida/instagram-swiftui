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
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG::: login failed. \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func signUp(withEmail email: String, password: String, image: UIImage?, fullName: String, userName: String) {
        
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
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
                
                print("Successfully registered user...")
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    self.userSession = user
                }
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        print("Fetch Users")
    }
    
    func resetPassword() {
        print("Reset Password")
    }
    
    
}
