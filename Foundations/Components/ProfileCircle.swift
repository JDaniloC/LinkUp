//
//  ProfileCircle.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 23/03/23.
//

import SwiftUI

struct ProfileCircle: View {
    @Binding private var imageStringB: String;
    @State private var imageString: String;
    @State private var profileName: String;
    @State private var radius: CGFloat;
    @State private var isBase64: Bool;
    
    init(_ imageString: String = "",
         bindingImage: Binding<String> = .constant(""),
         profileName: String = "",
         radius: CGFloat = 100,
         isBase64: Bool = false
    ) {
        self.radius = radius
        self.isBase64 = isBase64
        self.profileName = profileName
        
        self._imageStringB = bindingImage
        self.imageString = imageString
    }
    
    func getImage() -> Image {
        if (!isBase64 && imageString == "") {
            return Image(systemName: "person.crop.circle")
        } else if (!isBase64) {
            return Image(imageString)
        }
        if imageStringB == "" {
            return Image(
                systemName: imageString
            )
        }
        let imageData = Data(base64Encoded: imageStringB)
        if imageData != nil {
            return Image(
                uiImage: UIImage(data: imageData!)!
            ).resizable()
        }
        return Image(systemName: "person.crop.circle")
    }
    
    var verticalPadding: CGFloat {
        if imageString == "person.crop.circle.badge.plus" {
            return radius / 20
        }
        return 0
    }
    
    var body: some View {
        VStack {
            getImage()
                .resizable()
                .padding(.vertical, verticalPadding)
                .padding(.all, radius / 8)
                .background(Circle().fill(Color("card-color")))
                .shadow(radius: 4)
                .overlay(Circle().inset(by: 0)
                    .strokeBorder(
                        Color("light-yellow"),
                        lineWidth: radius / 13
                ))
                .frame(width: radius, height: radius)
            
            if (profileName != "") {
                Text(profileName)
                    .font(.inter(.regular, size: radius / 8))
                    .foregroundColor(.black)
                    .fontWeight(.light)
                    .padding(.top, radius / 10)
            }
        }
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    @State static var image: String = "claudia-maria"

    static var previews: some View {
        ProfileCircle(bindingImage: $image,
                      profileName: "Cláudia Maria",
                      radius: 100, isBase64: true)
    }
}
