//
//  DynamicsView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

struct Participant {
    var name: String
    var image: String
}

class DynamicsInfos: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var isConcluded: Bool
    let participants: [Participant]
    private var _offset: CGSize = .zero
    
    init(name: String, description: String, participants: [Participant]) {
        self.name = name
        self.isConcluded = false
        self.description = description
        self.participants = participants
    }
    
    var participantsNames: [String] {
        self.participants.map{ $0.name }
    }
    
    var participantsImages: [String] {
        self.participants.map{ $0.image }
    }
    
    public var offset: CGSize {
        get {
            return self._offset
        }
        set(newOffset) {
            self._offset = newOffset
            
        }
    }
}
