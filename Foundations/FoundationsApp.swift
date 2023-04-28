//  FoundationsApp.swift
//
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 14/03/23.
//

import SwiftUI

@main
struct FoundationsApp: App {
    @StateObject private var profileVM = ProfileViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView()
                .environmentObject(profileVM)
        }
    }
}
