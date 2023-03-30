//
//  Profile.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 28/03/23.
//

import SwiftUI

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.gray)
            .padding(.horizontal, 100)
            .padding(.vertical, 10)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(.lightGray))
                    Text("Teste").foregroundColor(.black)
                }
            )
    }
}

struct Profile: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileCircle("profile")
                        .padding(.top, 50)
                    Text("Alice Diniz")
                    Text("Me sentindo... atarefada")
                    Button(action: {
                        
                    }) {
                        Text("Novo Card")
                            .padding(.vertical, 5)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                    }.buttonStyle(.bordered)
                        .padding(.horizontal, 30)
                    LazyVGrid(
                        columns: columns,
                        spacing: 20
                    ) {
                        ProfileCard(
                            title: "Histórico"
                        ) {
                            CustomText("Confira as dinâmicas que você concluiu")
                        }
                        ProfileCard(
                            title: "Conexões"
                        ) {
                            HStack {
                                ProfileCircle("profile",
                                              radius: 45)
                                    .frame(height: 25)
                                ProfileCircle("kiev-gama",
                                              radius: 45)
                                    .padding(.leading, -20)
                                    .frame(height: 25)
                                Text("...").font(.custom(
                                        "Inter-Light",
                                        size: 16
                                ))
                            }
                        }
                        ProfileCard(
                            title: "Feedbacks"
                        ) {
                            CustomText("Leia os feedbacks que você recebeu")
                        }
                        ProfileCard(
                            title: "Músicas"
                        ) {
                            CustomText("Confira as músicas que você está compartilha")
                        }
                        ProfileCard(
                            title: "ScrollView Teste"
                        ) {
                            CustomText("Testando o scrollView")
                        }
                        ProfileCard(
                            title: "ScrollView Teste"
                        ) {
                            CustomText("Testando o scrollView")
                        }
                        ProfileCard(
                            title: "ScrollView Teste"
                        ) {
                            CustomText("Testando o scrollView")
                        }
                        ProfileCard(
                            title: "ScrollView Teste"
                        ) {
                            CustomText("Testando o scrollView")
                        }
                    }.padding(.all, 20)
                }
            }
            .navigationTitle("Meu perfil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meu perfil").font(.title2)
                        .bold()
                }
            }
            .navigationDestination(for: Relationship.self){ relationship in
                SomeView(texto: relationship.name)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
