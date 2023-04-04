//
//  ModalView.swift
//  Dynamics
//
//  Created by Madu on 04/04/23.
//

import SwiftUI

struct ModalView: View {
    @Binding var isModalOpen: Bool
    var infos: CardInformation

    var body: some View {
        ZStack {
            Color.primary.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .gesture(
                    TapGesture()
                    .onEnded {
                        isModalOpen.toggle()
                    }
                )
            
            VStack {
                HStack {
                    Spacer()
                    Button("Concluir") {
                    action: do {isModalOpen.toggle()}
                    }
                }

                Text(infos.name)
                
//                Text(card.description)
                Text("Formem um círculo, de modo que toquem os ombros um dos outros. Em seguida, cada um deve colocar a mão direita na mão de alguém que está do outro lado do círculo. Em seguida, a mão esquerda deve encostar na mão de uma pessoa diferente (não ao lado). Então, os vocês devem tentar desembaraçar o nó quebrado sem soltar as mãos.")

                Text("Participantes")
//                View dos participantes
            }
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .padding()

        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    @State var isOpen: Bool = false
//    static var previews: some View {
//        ModalView(isModalOpen: $isOpen, infos: CardInformation(name: "default"))
//    }
//}
