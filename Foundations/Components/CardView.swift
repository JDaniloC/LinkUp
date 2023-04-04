//
//  CardView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

struct CardInformation: Identifiable {
    var id = UUID()
    var name: String
    var offset: CGSize = .zero
    
    mutating func setOffset(newOffset: CGSize) {
        self.offset = newOffset
    }
}

struct CardView: View {
    var card: CardInformation

    @State private var offset = CGSize.zero
    @State private var isModalOpen = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 255/255, green: 233/255, blue: 204/255),
                            .white
                        ]
                    ),
                    startPoint: .top, endPoint: .bottom
                 ))
                .frame(width: 320, height: 200)
            
            VStack {
                Text(card.name)
                
                Button {
                    isModalOpen.toggle()
                } label: {
                    Image(systemName: "chevron.right")
                }
                .offset(x: 105, y: 45)
            }
            
                        
            if isModalOpen {
                ModalView(isModalOpen: $isModalOpen, infos: card)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardInformation(name: "default"))
    }
}
