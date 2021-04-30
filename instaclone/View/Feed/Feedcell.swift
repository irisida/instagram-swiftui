//
//  Feedcell.swift
//  instaclone
//
//  Created by ed on 21/04/2021.
//

import SwiftUI
import Kingfisher

struct Feedcell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440 )
                .clipped()
            
            // action buttons
            HStack (spacing: 16) {
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart" )
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .foregroundColor(didLike ? .red : .black)
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
                        .padding(4)
                })
            }.foregroundColor(.black).padding(.leading, 4)
            
            // engagement
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
            // caption
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14,
                                            weight: .semibold)) +
                    Text(" \(viewModel.post.caption)").font(.system(size: 15))
                
            }.padding(.horizontal, 8)
            
            Text("\(viewModel.post.timestamp.dateValue())")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
        }
    }
}

//struct Feedcell_Previews: PreviewProvider {
//    static var previews: some View {
//        Feedcell()
//    }
//}
