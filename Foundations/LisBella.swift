//
//  LisBella.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 28/03/23.
//

import SwiftUI

struct LisBella: View {
    var body: some View {
        ProfileCard(
            title: "Conexões"
        ) {
            HStack(spacing: -10) {
                ProfileCircle("profile",
                              radius: 45)
                    .frame(height: 25)
                ProfileCircle("kiev-gama",
                              radius: 45)
                    .frame(height: 25)
                Text("...").font(.custom(
                        "Inter-Light",
                        size: 16
                )).padding(.leading, 15)
            }
        }
    }
}

struct LisBella_Previews: PreviewProvider {
    static var previews: some View {
        LisBella()
    }
}
