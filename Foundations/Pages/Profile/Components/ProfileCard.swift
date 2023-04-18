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
                .font(.inter(.bold, size: 17))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            HStack(alignment: .bottom) {
                content
                Spacer()
                Image(
                    systemName: "chevron.right"
                ).foregroundColor(
                    Color("black-color"))
            }
        }.padding(.all, 20)
        .background(LinearGradient(
            gradient: Gradient(
                colors: [
                    Color("light-yellow"),
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
            ).stroke(Color("light-yellow"),
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
                .font(.inter(.regular, size: 15))
        }
    }
}
