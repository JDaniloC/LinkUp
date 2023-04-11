//
//  relationTest.swift
//  Foundations
//
//  Created by Mateus Costa Beltrão Tavares on 30/03/23.
//
//

import SwiftUI





struct RelationTest: View {
    let profile: MyProfile = MyProfile()

    let relationships: [Relationship] = [
        Relationship(name: "Kiev Gama", image: "kiev-gama" , coord: CGPoint(x:200,y:100)),
        Relationship(name: "Lisa Mello", image: "lisa-mello",coord: CGPoint(x:320,y:400))
    ]
    var nodes = [CGPoint(x:320,y:50),CGPoint(x:320,y: 500),CGPoint(x:50,y:100)]
    var myself = CGPoint(x:UIScreen.main.bounds.size.width/2,y:
                            UIScreen.main.bounds.size.height/2 )

    var n = 0
    var radius = 16.0
    var body: some View {
        NavigationStack {
            VStack {
                Text("Veja as pessoas de sua equipe que você já trabalhou e quais ainda precisa conhecer melhor")
                    .font(.custom("Inter-Light", size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(30)
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .fill(.white)
                    
//                    Link(coordP1:myself,
//                         coordP2:relationships[1].coord,
//                         imagePath: "profile",
//                         profileName: "Voce",
//                         imagePath2: relationships[0].image, profileName2: relationships[0].name)
                    ForEach(relationships, id: \.self, content: {
                     relationship in
                   //  NavigationLink(destination: Text("Second View") ) {
                     Link(coordP1:myself,
                          coordP2:relationship.coord,
                          imagePath: "profile",
                          profileName: "Voce",
                          imagePath2: relationship.image,
                          profileName2: relationship.name)
                 //   }
                     }) 
                   }
               
//                NavigationLink(value: profile) {
//                    ProfileCircle(imagePath: "profile",
//                                  profileName: "Você")
//                }
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

struct RelationTest_Previews: PreviewProvider {
    static var previews: some View {
        RelationTest()
    }
}
