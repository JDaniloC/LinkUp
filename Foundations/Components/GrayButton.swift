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
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(.lightGray))
            )
    }
}

struct GrayButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            
        }) {
            Text("Novo Card")
                .padding(.vertical, 5)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }.buttonStyle(.bordered)
            .padding(.horizontal, 30)
    }
}
