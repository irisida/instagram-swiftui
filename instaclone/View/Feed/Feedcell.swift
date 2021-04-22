//
//  Feedcell.swift
//  instaclone
//
//  Created by ed on 21/04/2021.
//

import SwiftUI

struct Feedcell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Batman")
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            
            // post image
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440 )
                .clipped()
            
            // action buttons
            HStack (spacing: 16) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 16))
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
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
            // caption
            HStack {
                Text("Batman").font(.system(size: 14,
                                            weight: .semibold)) +
                    Text(" All men have limits. They learn what they are and do not exceed them. I ignore mine").font(.system(size: 15))
                
            }.padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
            
        }
    }
}

struct Feedcell_Previews: PreviewProvider {
    static var previews: some View {
        Feedcell()
    }
}
