//
//  Relationships.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 23/03/23.
//

import SwiftUI

struct MyProfile: Hashable {};

struct Relationships: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @State var navPath: NavigationPath = .init()

    let relationships: [Profile] = [
        Profile(
            name: "Kiev Gama",
            image: "kiev-gama",
            status: "Estou me sentindo... Focado",
            cardList: [
                CardInfo(
                    text: """
                    Fui ao supermercado fazer umas compras e, chegando lá, lembrei-me de que precisava de uma vassoura nova. Peguei tudo o que queria comprar e fui ao caixa. Quando passei a vassoura, a funcionária perguntou:
                    – Vai levar montada?
                    Sem perceber que ela se referia à conexão entre o cabo e a ponta da vassoura, respondi, brincando:
                        – Não! Tenho medo de altura, prefiro caminhar!
                    """,
                    title: "História",
                    description: "Confira a história que você está compartilhando"
                )
            ]
        ),
        Profile(
            name: "Lisa Mello",
            image: "lisa-mello",
            status: "Estou mse sentindo... Muito bem!",
            cardList: [
                CardInfo(
                    text: "Com esse projeto espero aprender a fazer animações com o figma e aprender o básico de programação.",
                    title: "Objetivos",
                    description: "Confira os objetivos que você está compartilhando"
                )
            ]
        )
    ]

    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Text("Veja as pessoas de sua equipe que você já trabalhou e quais ainda precisa conhecer melhor")
                    .font(.custom("Inter-Light", size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(30)

                ForEach(relationships, id: \.self.id) { profile in
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

struct Relationships_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var profileVM = ProfileViewModel()
        Relationships().environmentObject(profileVM)
    }
}
