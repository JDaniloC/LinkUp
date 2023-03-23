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
    
    init(imagePath: String, profileName: String) {
        self.imagePath = imagePath;
        self.profileName = profileName;
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image(imagePath)
                Circle()
                    .inset(by: 0)
                    .stroke(Color("light-yellow"),
                            lineWidth: 8)
            }.frame(width: 100, height: 120)
            Text(profileName)
                .foregroundColor(.black)
                .fontWeight(.light)
        }
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle(imagePath: "profile",
                      profileName: "Example")
    }
}
