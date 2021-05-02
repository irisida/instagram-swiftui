//
//  ResetPassword.swift
//  instaclone
//
//  Created by ed on 24/04/2021.
//

import SwiftUI

struct ResetPassword: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                Image("instagram_logo_white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .padding(.top, 100)
                
                // email textField
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                }
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(#colorLiteral(red: 0.9098039269, green: 0.1368103683, blue: 0.49460866, alpha: 1)))
                        .clipShape(Capsule())
                        .padding()
                        .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:4, y:7 )
                })
                
                Spacer()
                
                Button(action: {mode.wrappedValue.dismiss()} , label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }).foregroundColor(.white).padding(.bottom, 32)
                
            }
        }
        // uses the @Published value for didSendReset
        // to control the dismissal of the reset screen
        // returning to login screen.
        .onReceive(viewModel.$didSendReset) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}
