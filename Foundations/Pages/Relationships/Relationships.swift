//
//  Relationships.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 23/03/23.
//

import SwiftUI

struct Relationships {}

struct Node: Identifiable {
    var id: UUID
    var name: String
    var image: String
    var position: CGPoint
}

struct EdgeShape: Shape {
    var start: CGPoint
    var end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: start)
        path.addLine(to: end)

        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(
            scaleX: multiplier, y: rect.height)
        return path.applying(transform)
    }
}
