//
//  NavigationView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

struct NavigationView: View {
    @StateObject var relationsVM = RelationshipsViewModel()
    @StateObject var navigationVM = NavigationViewModel()
    @StateObject var dynamicsVM = DynamicsViewModel()

    var body: some View {
        TabView(selection: $navigationVM.selectedTab) {
            RelationshipsView(relationsVM: relationsVM)
                .tabItem() {
                    renderTagIcon(label: "Conexões",
                        optionToVerify: Tabs.relationships)
                }
                .tag(Tabs.relationships)
                .environmentObject(dynamicsVM)
                .environmentObject(navigationVM)

            DynamicsView()
                .tabItem() {
                    renderTagIcon(label: "Dinâmicas",
                        optionToVerify: Tabs.dynamics)
                }
                .tag(Tabs.dynamics)
                .environmentObject(dynamicsVM)
                .environmentObject(relationsVM)

            ProfileView()
                .tabItem() {
                    renderTagIcon(label: "Meu perfil",
                        optionToVerify: Tabs.profile)
                }
                .tag(Tabs.profile)
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
    @StateObject static private var profileVM = ProfileViewModel()

    static var previews: some View {
        NavigationView()
            .environmentObject(profileVM)
    }
}
