//
//  ProfileView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//  
//

import SwiftUI

struct ProfileView: View {
    public var pageName: String = "Meu Perfil"
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var navigationVM: NavigationViewModel

    func navigateToDynamics() {
        navigationVM.setSelectedTab(navigateTo: Tabs.dynamics)
    }
    
    var body: some View {
        VStack {
            Text(pageName)
                .font(.title2)
                .bold()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileCircle(profileVM.profile.image)
                        .padding(.top, 50)
                    Text(profileVM.profile.name)
                    Text(profileVM.profile.status)
                    
                    if pageName == "Meu Perfil" {
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

//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        @StateObject var profileVM = ProfileViewModel()
//        @StateObject var navigationVM = NavigationViewModel()
//        ProfileView()
//            .environmentObject(profileVM)
//            .environmentObject(navigationVM)
//    }
//}
