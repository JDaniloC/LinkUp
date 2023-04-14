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
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationStack{
            VStack {
                Text(pageName)
                    .font(.title2)
                    .bold()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ProfileCircle(viewModel.profile.image)
                            .padding(.top, 50)
                        Text(viewModel.profile.name)
                        Text(viewModel.profile.status)
                        NavigationLink(
                            destination: CreateCard()){
                                NewCardButton()
                            }
//                        
                        ProfileCardGrid()
                        
                        
                    }
                }
            }
        }
        
    }
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var profileVM = ProfileViewModel()
        ProfileView().environmentObject(profileVM)
    }
}

struct NewCardButton: View{
    var body: some View{
        Text("Novo Card")
            .padding(.vertical)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity,
                   alignment: .leading
            )
            .buttonStyle(.bordered)
            .padding(.horizontal, 30)
    }
}
