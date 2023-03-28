//
//  ContentView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 14/03/23.
//

import SwiftUI

enum Tabs: Hashable {
    case relationships, dynamics, profile
    
    var getIcon: String {
        switch(self) {
            case .relationships:
                return "team-icon"
            case .dynamics:
                return "dynamics-icon"
            case .profile:
                return "person-icon"
        }
    }
}

struct ContentView: View {
    @State private var selection: Tabs = Tabs.relationships;
    
    var body: some View {
        TabView(selection: $selection) {
            Relationships()
                .tabItem() {
                    renderTagIcon(
                        label: "Conexões",
                        optionToVerify: Tabs.relationships)
                }
                .tag(Tabs.relationships)
            AdvancedSettingsView()
                .tabItem() {
                    renderTagIcon(
                        label: "Dinâmicas",
                        optionToVerify: Tabs.dynamics)
                }
                .tag(Tabs.dynamics)
            AdvancedSettingsView()
                .tabItem() {
                    renderTagIcon(
                        label: "Meu perfil",
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
            let isSelected = selection == option;
            var iconName: String = option.getIcon;
            Image(isSelected ? "selected-\(iconName)": iconName)
            Text(label)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
