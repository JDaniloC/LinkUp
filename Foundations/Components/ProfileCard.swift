//
//  ProfileCard.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 28/03/23.
//

import SwiftUI

struct ProfileCard<Content: View>: View {
    @State public var title: String;
    @ViewBuilder public var content: Content;

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(
                    Color("black-color"))
                .font(.custom("Inter-Bold",
                              size: 17))
                .fontWeight(.bold)
            Spacer()
            HStack(alignment: .bottom) {
                content
                Spacer()
                Button(action: {
                    
                }) {
                    Image(
                        systemName: "chevron.right"
                    ).foregroundColor(
                        Color("black-color"))
                }
            }
        }.padding(.all, 20)
        .background(LinearGradient(
            gradient: Gradient(
                colors: [
                    Color("card-color"),
                    .white
                ]
            ),
            startPoint: .top, endPoint: .bottom
         ))
        .cornerRadius(20)
        .frame(width: 165, height: 130)
        .overlay(
            RoundedRectangle(
                cornerRadius: 20
            ).stroke(Color("card-color"),
                     lineWidth: 2)
        )
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard(
            title: "Title"
        ) {
            Text("Alguma coisa")
                .foregroundColor(
                    Color("black-color"))
                .font(.custom("Inter-Regular",
                              size: 15))
        }
    }
}
