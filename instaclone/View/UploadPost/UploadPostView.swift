//
//  UploadPostView.swift
//  instaclone
//
//  Created by ed on 20/04/2021.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    
    var body: some View {
        VStack {
            if postImage == nil {
                
                // action triggers the modal/sheet view by
                // toggling the imagePickerPresented.
                // sheet evaluates isPresented on the value
                // of the toggled state. OnDismiss event
                // calls the loadImage extension function
                Button(action: { imagePickerPresented.toggle() } , label: {
                    Image(systemName: "camera.circle")
                        .resizable()
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .font(Font.title.weight(.ultraLight))
                        .frame(width: 180, height: 180)
                        .foregroundColor(Color.black)
                        .clipped()
                        .padding(.top, 56)
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                
            } else if let image = postImage {
                // postImage has been selected using the UIKit
                // ImagePicker wrapped controller and we can
                // now present the rest of the new post screen
                // that allows for caption entry. The post
                // should have the selectedImage presented
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill() 
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "Add caption")
                        .frame(height: 200)
                }.padding()
                
                HStack(spacing: 16) {
                    // Cancel / post reset
                    Button(action: {
                        captionText = ""
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(5.0)
                    })
                    
                    // share / post completion button
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                            }
                        }
                        
                    }, label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5.0)
                    })
                }.padding()
            }
            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        // builds a swiftUI compatible image from a UIKit UIImage
        postImage = Image(uiImage: selectedImage)
    }
}


