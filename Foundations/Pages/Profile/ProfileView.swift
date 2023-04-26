//
//  ProfileView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//  
//

import SwiftUI

struct ProfileView: View {
    @State private var creatingNewCard = false
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var navigationVM: NavigationViewModel

    public var pageName: String = "Meu Perfil"

    func changeImage(newImage: String) {
        profileVM.profile.image = newImage
    }
    
    func navigateToDynamics() {
        navigationVM.setSelectedTab(navigateTo: Tabs.dynamics)
    }
    
    var body: some View {
        VStack {
            Text(pageName)
                .font(.title2)
                .bold()
                .padding(.bottom, 30)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    if pageName == "Meu Perfil" {
                        MemojiInputView(
                            profileVM.profile.image,
                            handler: changeImage
                        ).frame(width: 100, height: 140)
                    } else {
                        ProfileCircle(profileVM.profile.image)
                            .padding(.top, 10)
                    }
                    Text(profileVM.profile.name)
                    Text(profileVM.profile.status)
                    
                    if pageName == "Meu Perfil" {
                        Button(action: {
                            creatingNewCard.toggle()
                        }) {
                            Text("Novo Card")
                                .padding(.vertical, 5)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                        }.buttonStyle(.bordered)
                            .padding(.horizontal, 30)
                    } else {
                        Button(action: {
                            navigateToDynamics()
                        }, label: {
                            Text("Melhorar Conexão")
                                .padding(5)
                        })
                        .buttonStyle(.borderedProminent)
                    }
                    ProfileCardGrid()
                }
            }
        }.fullScreenCover(isPresented: $creatingNewCard) {
            CreateCard(isShowing: $creatingNewCard)
        }
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var profileVM = ProfileViewModel()
        @StateObject var navigationVM = NavigationViewModel()
        ProfileView()
            .environmentObject(profileVM)
            .environmentObject(navigationVM)
    }
}
