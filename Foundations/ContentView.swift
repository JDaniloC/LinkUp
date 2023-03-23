//
//  ContentView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 14/03/23.
//

import SwiftUI

struct ContentView: View {
    private enum Tabs: Hashable {
        case general, advanced
    }
    
    @State private var idadeCao: String = "";
    @State private var idadeCao2: Int = 0;
    
    var body: some View {
        TabView {
            Relationships()
                .tabItem() {
                    Label("Conexões",
                          image: "team-icon")
                }
                .tag(Tabs.general)
            AdvancedSettingsView()
                .tabItem() {
                    Label("Dinâmicas",
                          image: "dynamics-icon")
                }
                .tag(Tabs.advanced)
            AdvancedSettingsView()
                .tabItem() {
                    Label("Meu Perfil",
                          image: "person-icon")
                }
                .tag(Tabs.advanced)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
