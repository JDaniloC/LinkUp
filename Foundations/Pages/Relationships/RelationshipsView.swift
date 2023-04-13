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

    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Text("Veja as pessoas de sua equipe que você já trabalhou e quais ainda precisa conhecer melhor")
                    .font(.custom("Inter-Light", size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(30)

                ForEach(relationsVM.relationships,
                        id: \.self.id) { profile in
                    NavigationLink(value: profile) {
                        ProfileCircle(profile.image,
                                      profileName: profile.name)
                        .onTapGesture {
                            profileVM.setProfileData(
                                newProfile: profile)
                            navPath.append(profile)
                        }
                    }
                }
                Spacer()
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

struct RelationshipsView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var profileVM = ProfileViewModel()
        @StateObject var relationsVM = RelationshipsViewModel()
        RelationshipsView(relationsVM: relationsVM)
            .environmentObject(profileVM)
    }
}
