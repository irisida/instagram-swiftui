//
//  EditProfileView.swift
//  instaclone
//
//  Created by ed on 02/05/2021.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.saveProfileData(userBio: bioText)
                }, label: {
                    Text("Done")
                        .bold()
                })
                
            }
            .padding()
            .padding(.horizontal, 24)
            
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: UIScreen.main.bounds.width - 64, height: 200)
                .padding(.horizontal, 32)
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
        
    }
}

