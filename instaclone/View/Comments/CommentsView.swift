//
//  CommentsView.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText = ""
    @ObservedObject var viewModel:  CommentsViewModel
    
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            // comment cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                            
                    }
                }
            }.padding(.top)
            
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

