//
//  UserCell.swift
//  instaclone
//
//  Created by ed on 22/04/2021.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // Image
            Image("robin")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            // Vstack user details
            VStack(alignment: .leading) {
                Text("Batman").font(.system(size: 14, weight: .semibold))
                Text("Bruce wayne").font(.system(size: 14))
            }
            
            Spacer()
        }
        
        
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
    
