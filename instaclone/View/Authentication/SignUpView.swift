//
//  SignUpView.swift
//  instaclone
//
//  Created by ed on 24/04/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State var imagePickerPresented = false
    
    @State private var fullName = ""
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                if let image = postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color(white: 1, opacity: 0.75))
                        .font(Font.title.weight(.ultraLight))
                        .padding(.vertical, 32)
                        .clipShape(Circle())
                } else {
                    Button(action: {imagePickerPresented.toggle()} , label: {
                        Image(systemName: "camera.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 150)
                            .foregroundColor(Color(white: 1, opacity: 0.75))
                            .font(Font.title.weight(.ultraLight))
                            .padding(.vertical, 32)
                    }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage)
                    })
                }
                
                
                
                VStack(spacing: 20) {
                    // Full name textField
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // email textField
                    CustomTextField(text: $userName, placeholder: Text("Username"), imageName: "person.crop.circle")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    // email textField
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .keyboardType(.emailAddress)
                    
                    // password field
                    CustomSecureField(text: $password, placeholder: Text("password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }.padding(.bottom, 32)
                
                
                
                Button(action: {}, label: {
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
    }
}

extension SignUpView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        // builds a swiftUI compatible image from a UIKit UIImage
        postImage = Image(uiImage: selectedImage)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
