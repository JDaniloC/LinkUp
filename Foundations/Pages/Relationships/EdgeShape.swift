//
//  EdgeShape.swift
//  TestApp
//
//  Created by Mateus Costa Beltrão Tavares on 20/03/23.
//

import Foundation
import SwiftUI

struct EdgeShape: Shape {
    var start: CGPoint
    var end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: start)
        path.addLine(to: end)
        
        return path
    }
}
