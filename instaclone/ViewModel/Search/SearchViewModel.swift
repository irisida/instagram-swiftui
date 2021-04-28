//
//  SearchViewModel.swift
//  instaclone
//
//  Created by ed on 26/04/2021.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            
            print(self.users)
        }
    }
    
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullName.lowercased().contains(lowercasedQuery) ||
                                $0.userName.contains(lowercasedQuery) })
        
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}


