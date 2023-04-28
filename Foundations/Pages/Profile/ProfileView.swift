//
//  ProfileView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//  
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var dynamicsVM: DynamicsViewModel
    @EnvironmentObject var navigationVM: NavigationViewModel

    public var pageName: String = "Meu Perfil"

    func changeImage(newImage: String) {
        profileVM.profile.image = newImage
    }
    
    func navigateToDynamics() {
        dynamicsVM.filter = profileVM.profile.name
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
                    
                    if profileVM.isMyProfile {
                        MemojiInputView(
                            profileVM.profile.image,
                            handler: changeImage
                        ).frame(width: 100, height: 140)
                    } else {
                        ProfileCircle(profileVM.profile.image)
                            .padding(.top, 10)
                    }
                    Text(profileVM.profile.name)
                    HStack(spacing: 0) {
                        Text("Me sentindo... ")
                        if profileVM.isMyProfile {
                            DynamicStatus()
                        } else{
                            Text(profileVM.profile.status)
                        }
                    }

                    if profileVM.isMyProfile {
                        Button(action: {
                            profileVM.toggleCreatingNewCard()
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
        }.fullScreenCover(isPresented: $profileVM.creatingNewCard) {
            CreateCard()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    @StateObject static var profileVM = ProfileViewModel()
    @StateObject static var dynamicsVM = DynamicsViewModel()
    @StateObject static var navigationVM = NavigationViewModel()

    static var previews: some View {
       ProfileView()
           .environmentObject(profileVM)
           .environmentObject(dynamicsVM)
           .environmentObject(navigationVM)
   }
}


