//
//  ProfileHeaderView.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView()
                    UserStatView()
                    UserStatView()
                }.padding(.trailing, 32)
            }
            
            Text("Bruce Wayne")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight | Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 2)
            
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit Profile")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: 1.0 ))
                        
                })
                Spacer()
            }.padding(.top)
        }
    }
}

struct UserStatView: View {
    var body: some View {
        VStack {
            Text("2").font(.system(size: 15, weight: .semibold))
            
            Text("Followers").font(.system(size: 15))
        }.frame(width: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
