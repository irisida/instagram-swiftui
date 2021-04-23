//
//  NotificationsView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20 ) {
                ForEach(0 ..< 20) { _ in
                        NotificationsCell()
                            .padding(.top)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
