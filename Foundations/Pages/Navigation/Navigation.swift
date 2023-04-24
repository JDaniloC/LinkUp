//
//  Navigation.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

enum Tabs: CaseIterable {
    case relationships, dynamics, profile

    var icon: String {
        switch (self) {
            case .relationships:
                return "team-icon"
            case .dynamics:
                return "dynamics-icon"
            case .profile:
                return "person-icon"
        }
    }
}
