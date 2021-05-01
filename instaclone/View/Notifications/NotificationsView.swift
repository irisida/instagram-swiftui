//
//  NotificationsView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct NotificationsView: View {
    
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20 ) {
                ForEach(viewModel.notifications) { notification in
                        NotificationsCell(notification: notification)
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
