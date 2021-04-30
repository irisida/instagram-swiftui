//
//  CustomInputView.swift
//  instaclone
//
//  Created by ed on 30/04/2021.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.65)
                .padding(.bottom, 8)
            
            // HStack with textfled and send button
            HStack {
                TextField("comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }        
    }
}

