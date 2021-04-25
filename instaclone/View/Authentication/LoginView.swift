//
//  LoginView.swift
//  instaclone
//
//  Created by ed on 24/04/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("instagram_logo_white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                    
                    // email textField
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("ForgotPassword?").font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 36)
                                .foregroundColor(.white)
                                .opacity(0.7)
                        })
                    }
                    
                    Button(action: {
                        viewModel.login()
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(#colorLiteral(red: 0.9098039269, green: 0.1368103683, blue: 0.49460866, alpha: 1)))
                            .clipShape(Capsule())
                            .padding()
                            .shadow(color: Color.black.opacity(0.2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:4, y:7 )
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: SignUpView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }).foregroundColor(.white).padding(.bottom, 32)
                    
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
