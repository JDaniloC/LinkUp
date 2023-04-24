//
//  NavigationView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

struct NavigationView: View {
    @StateObject private var profileVM = ProfileViewModel()
    @StateObject private var relationVM = ProfileViewModel()
    @StateObject var relationsVM = RelationshipsViewModel()
    @StateObject var navigationVM = NavigationViewModel()

    var body: some View {
        TabView(selection: $navigationVM.selectedTab) {
            RelationshipsView(relationsVM: relationsVM)
                .tabItem() {
                    renderTagIcon(
                        label: "Conexões",
                        optionToVerify: Tabs.relationships)
                }
                .tag(Tabs.relationships)
                .environmentObject(relationVM)
                .environmentObject(navigationVM)

            Dynamics()
                .tabItem() {
                    renderTagIcon(
                        label: "Dinâmicas",
                        optionToVerify: Tabs.dynamics)
                }
                .tag(Tabs.dynamics)

            ProfileView()
                .tabItem() {
                    renderTagIcon(
                        label: "Meu perfil",
                        optionToVerify: Tabs.profile)
                }
                .tag(Tabs.profile)
                .environmentObject(profileVM)
        }
    }


    private func renderTagIcon(
        label: String,
        optionToVerify option: Tabs
    ) -> some View {
        VStack {
            let isSelected = navigationVM.selectedTab == option;
            let iconName: String = option.icon;
            Image(isSelected ? "selected-\(iconName)": iconName)
            Text(label)
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
