//
//  PostGridView.swift
//  instaclone
//
//  Created by ed on 22/04/2021.
//

import SwiftUI
import Kingfisher


struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfig
    
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfig) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: Feedcell(viewModel: FeedCellViewModel(post: post)),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
            }
        })
    }
}

