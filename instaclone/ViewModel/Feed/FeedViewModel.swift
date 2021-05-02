//
//  FeedViewModel.swift
//  instaclone
//
//  Created by ed on 28/04/2021.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    //@Published var user: User
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
//    func filteredPosts(_ query: String) -> [Post] {
//        let lowercasedQuery = query.lowercased()
//        return nil
//    }
}
