//
//  FeedView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 32) {
                ForEach(0 ..< 10) { _ in
                    Feedcell()
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
