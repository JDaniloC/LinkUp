//
//  GradientBackground.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color("card-color"),
                    .white, .white, .white
                ]
            ),
            startPoint: .top, endPoint: .bottom
        ).edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground().ignoresSafeArea()
    }
}
