//
//  Profile.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 28/03/23.
//

import SwiftUI

struct CardInfo: Hashable, Identifiable {
    let id: UUID = UUID()
    var text: String
    var title: String
    var description: String
}

struct TextCardInfo {
    var title: String
    var text: String
}

struct Profile: Hashable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var image: String
    var status: String
    
    var cardList: [CardInfo]
}
