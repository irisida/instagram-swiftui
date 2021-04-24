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
    
    
    var body: some View {
        VStack {
            if postImage != nil {
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "camera.circle")
                        .resizable()
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .font(Font.title.weight(.ultraLight))
                        .frame(width: 180, height: 180)
                        .foregroundColor(Color.black)
                        .clipped()
                        .padding(.top, 56)
                })
            } else {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter the post caption", text: $captionText )
                }.padding()
                
                Button(action: {}, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }).padding()
            }
            
            Spacer()
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
