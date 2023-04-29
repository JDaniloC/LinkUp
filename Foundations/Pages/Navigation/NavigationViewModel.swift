//
//  NavigationViewModel.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

final class NavigationViewModel: ObservableObject {
    @Published var selectedTab: Tabs = Tabs.relationships;
    
    func setSelectedTab(navigateTo choosenTab: Tabs) {
        self.selectedTab = choosenTab
    }
}
