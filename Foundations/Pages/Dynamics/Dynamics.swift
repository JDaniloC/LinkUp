//
//  DynamicsView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

class CardInformation: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var isConcluded: Bool
    let participants: [String]
    private var _offset: CGSize = .zero
    
    init(name: String, description: String, photos: [String]) {
        self.name = name
        self.description = description
        self.isConcluded = false
        self.participants = photos
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
