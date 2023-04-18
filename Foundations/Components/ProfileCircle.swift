//
//  ProfileCircle.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 23/03/23.
//

import SwiftUI

struct ProfileCircle: View {
    @State private var imagePath: String;
    @State private var profileName: String;
    @State private var radius: CGFloat;
    
    init(_ imagePath: String,
         profileName: String = "",
         radius: CGFloat = 100
    ) {
        self.radius = radius;
        self.imagePath = imagePath;
        self.profileName = profileName;
    }
    
    var body: some View {
        VStack {
            Image(imagePath)
                .resizable()
                .shadow(radius: 10)
                .overlay(Circle()
                    .inset(by: 0)
                    .stroke(
                        Color("light-yellow"),
                        lineWidth: radius / 10
                    )
            ).frame(width: radius, height: radius)
             .padding(.bottom, radius / 20)
            
            if (profileName != "") {
                Text(profileName)
                    .font(.custom("Inter-Regular",
                                  size: 13))
                    .foregroundColor(.black)
                    .fontWeight(.light)
            }
        }
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle("profile",
                      profileName: "Example")
    }
}
