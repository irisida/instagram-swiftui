//
//  UserStatView.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }.frame(width: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}
