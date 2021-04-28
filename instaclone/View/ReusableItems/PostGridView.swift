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
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: FeedView(),
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

