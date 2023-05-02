//
//  ProfileCardView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//

import SwiftUI

struct ProfileCardView<Content: View>: View {
    @Binding public var title: String
    @ViewBuilder public var content: Content
    
    init(_ title: Binding<String>,
         @ViewBuilder content: () -> Content) {
        self._title = title
        self.content = content()
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(title)
                    .foregroundColor(Color("black-color"))
                    .font(.inter(.bold, size: 30))
                    .padding(.vertical, 40)
                content.padding()
            }.frame(maxWidth: .infinity)
        }.background(GradientBackground())
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    @State static var titleCard: String = "Título do card"

    static var previews: some View {
        ProfileCardView($titleCard) {
            Text("Texto dentro do card")
        }
    }
}
