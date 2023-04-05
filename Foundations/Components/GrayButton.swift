//
//  GrayButton.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//

import SwiftUI

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.gray)
            .padding(.horizontal, 100)
            .padding(.vertical, 10)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(.lightGray))
                    Text("Teste").foregroundColor(.black)
                }
            )
    }
}
