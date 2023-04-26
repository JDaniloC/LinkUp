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
    @State private var statusBar = statusBarModel()
    @State private var toggleChangeStatus = true
    @State private var creatingNewCard = false
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
                    HStack(spacing: 0){
                        Text("Me sentindo... ")
                        if toggleChangeStatus{
                           Text(statusBar.status)
                            
                        }else{
                            TextField("", text: $statusBar.status)
                                .frame(minWidth: 30)
                                .fixedSize()
                                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color("card-color")))
                                .textInputAutocapitalization(.never)
                                .onSubmit {
                                    toggleChangeStatus = !toggleChangeStatus
                                }
                                
                                          
                        }
                        
                        Button {
                            toggleChangeStatus = !toggleChangeStatus
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    
                                            
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

class statusBarModel: ObservableObject {
    var limit: Int = 15

    @Published var status: String = "" {
        didSet {
            if status.count > limit {
                status = String(status.prefix(limit))
            }
        }
     
        
    }
    
}



