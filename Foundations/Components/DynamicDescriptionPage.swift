//
//  DynamicDescriptionPage.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicDescriptionPage: View {
    @Binding var isModalOpen: Bool
    @Binding var isConcluded: Bool
    var title: String = "Title"
    var description: String = "descrição default da verdade ou mentira Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    var photos: [String] = ["profile"]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isModalOpen.toggle()
                }, label: {
                    Image(systemName: "chevron.left")
                    Text("Voltar")
                })
                .padding(.leading)
                Spacer()
            }

            Text(title)
                .font(.inter(.semibold, size: 35))
                .padding(.top, 80)

            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Descrição").font(.inter(.medium))
                Text(description)
                    .font(.inter(.regular, size: 17))
                
                Text("Participam da dinâmica")
                    .font(.inter(.medium))
                HStack {
                    ForEach(photos, id: \.self) {photo in
                        ProfileCircle(photo, radius: 50)
                    }
                }
            }.padding()
            Spacer()

            Button(action: {
                isModalOpen.toggle()
                isConcluded = true
            }, label: {
                Text("Concluir")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 140)
            })
            .padding(.bottom)
            .buttonStyle(.borderedProminent)
        }
        .background(GradientBackground())
    }
}
//struct DynamicDescriptionPage_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var isModalOpen: Bool = false
//        @State var isConcluded: Bool = false
//        DynamicDescriptionPage(
//            isModalOpen: $isModalOpen,
//            isConcluded: $isConcluded
//        )
//    }
//}
