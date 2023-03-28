//
//  Relationships.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 23/03/23.
//

import SwiftUI

struct Relationship: Hashable {
     var name: String
     var image: String
 }

struct MyProfile: Hashable {};

struct SomeView: View {
     var texto: String = ""

     var body: some View {
         Text("\(texto)")
     }
}

struct Relationships: View {
    let profile: MyProfile = MyProfile()

    let relationships: [Relationship] = [
        Relationship(name: "Kiev Gama", image: "kiev-gama"),
        Relationship(name: "Lisa Mello", image: "lisa-mello")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                Text("Veja as pessoas de sua equipe que você já trabalhou e quais ainda precisa conhecer melhor")
                    .font(.custom("Inter-Light", size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(30)
                    
                ForEach(relationships, id: \.self, content: {
                    relationship in
                    NavigationLink(value: relationship) {
                        ProfileCircle(imagePath: relationship.image,
                                      profileName: relationship.name)
                    }
                })
                NavigationLink(value: profile) {
                    ProfileCircle(imagePath: "profile",
                                  profileName: "Você")
                }
            }
            .navigationTitle("Minhas conexões")
            .navigationBarTitleDisplayMode(.inline
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Minhas conexões").font(.title2)
                        .bold()
                }
            }
            .navigationDestination(for: Relationship.self){ relationship in
                SomeView(texto: relationship.name)
            }
            .navigationDestination(for: MyProfile.self) { _ in
                SomeView(texto: "Meu profile")
            }
        }
    }
}

struct Relationships_Previews: PreviewProvider {
    static var previews: some View {
        Relationships()
    }
}
