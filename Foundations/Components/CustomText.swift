//
//  CustomText.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 30/03/23.
//

import SwiftUI

struct CustomText: View {
    @State private var text: String;
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(
                Color("black-color"))
            .font(.custom("Inter-Regular",
                          size: 15))
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText("Texto de exemplo")
    }
}
