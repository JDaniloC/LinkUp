//
//  RelationshipsView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 12/04/23.
//

import SwiftUI

struct RelationshipsView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @ObservedObject var relationsVM: RelationshipsViewModel
    @State var navPath: NavigationPath = .init()
    
    func navigate(node: Node) {
        let profile = relationsVM.getRelationByNode(node: node)
        profileVM.setProfileData(newProfile: profile)
        navPath.removeLast(navPath.count)
        navPath.append(profile)
    }
    
    func getPosition(
        geometry: GeometryProxy,
        position: CGPoint
    ) -> CGPoint {
        let size = geometry.size
        return CGPoint(
            x: position.x * size.width,
            y: position.y * size.height + 10
        )
    }
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Text("Veja as pessoas de sua equipe que você já trabalhou e quais ainda precisa conhecer melhor")
                    .font(.inter(.light, size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(30)
                ZStack {
                    ForEach(relationsVM.nodes) { n in
                        EdgeShape(start: CGPoint(x: 0.5,
                                                 y: 0.5),
                                  end: CGPoint(
                                    x: n.position.x,
                                    y: n.position.y))
                        .stroke(Color("line-color"),
                                lineWidth: 2)
                        .shadow(radius: 1)
                    }
                    GeometryReader { geometry in
                        ForEach(relationsVM.nodes) { node in
                            ProfileCircle(node.image,
                                profileName: node.name,
                                radius: 60
                            )
                            .position(getPosition(
                                geometry: geometry,
                                position: node.position
                            ))
                            .onTapGesture {
                                self.navigate(node: node)
                            }
                        }
                        ProfileCircle("profile",
                            profileName: "Sofia",
                            radius: 60
                        ).position(getPosition(
                            geometry: geometry,
                            position: CGPoint(x: 0.5, y: 0.5)
                        ))
                    }
                }.padding(40)
            }
            .navigationTitle("Minhas conexões")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Minhas conexões")
                        .font(.title2)
                        .bold()
                }
            }
            .navigationDestination(for: Profile.self) { profile in
                ProfileView(pageName: "Perfil")
            }
        }
    }
}

//struct RelationshipsView_Previews: PreviewProvider {
//    static var previews: some View {
//        @StateObject var profileVM = ProfileViewModel()
//        @StateObject var relationsVM = RelationshipsViewModel()
//        RelationshipsView(relationsVM: relationsVM)
//            .environmentObject(profileVM)
//    }
//}
