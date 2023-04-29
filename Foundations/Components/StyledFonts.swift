//
//  StyledFonts.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 18/04/23.
//

import SwiftUI

extension Font {
    enum Inter {
        case bold
        case light
        case medium
        case regular
        case semibold
        case custom(String)
        
        var value: String {
            switch self {
            case .bold:
                return "Inter-Bold"

            case .light:
                return "Inter-Light"
                
            case .semibold:
                return "Inter-SemiBold"
             
            case .medium:
                return "Inter-Medium"

            case .regular:
                return "Inter-Regular"
                
            case .custom(let name):
                return name
            }
        }
    }
    
    static func inter(_ type: Inter, size: CGFloat = 25) -> Font {
        return .custom(type.value, size: size)
    }
}
