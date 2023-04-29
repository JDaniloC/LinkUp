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

struct Feedback: Hashable {
    var name: String
    var text: String
    var image: String
}

struct TextCardInfo {
    var title: String
    var text: String
}

struct Profile: Hashable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var image: String
    var force: Int = 0
    var status: String
    
    var cardList: [CardInfo]
    var feedbacks: [Feedback]
}

enum CreateCardFields: Hashable {
    case title
    case description
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

