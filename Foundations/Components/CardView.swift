//
//  CardView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

class CardInformation: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var isConcluded: Bool
    let participants: [String]
    private var _offset: CGSize = .zero
    
    init(name: String, description: String, photos: [String]) {
        self.name = name
        self.description = description
        self.isConcluded = false
        self.participants = photos
    }
    
    public var offset: CGSize {
        get {
            return self._offset
        }
        set(newOffset) {
            self._offset = newOffset
            
        }
    }
}

struct CardView: View {
    var card: CardInformation

    @State private var offset = CGSize.zero
    @State private var isModalOpen = false
    @State private var isConcluded = false

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
                .frame(width: 350, height: 235)
                .onTapGesture {
                    isModalOpen.toggle()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 255/255, green: 244/255, blue: 228/255), lineWidth: 5)
                )

            VStack {
                Text(card.name)
                    .font(.title)
                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
            }
            .fullScreenCover(isPresented: $isModalOpen) {
                DynamicDescriptionPage(isModalOpen: $isModalOpen, isConcluded: $isConcluded, title: card.name, description: card.description, photos: card.participants)
            }
            .onDisappear(perform: {card.isConcluded = isConcluded})
            //card.isConcluded = isConcluded
        }
    }
    
    func concluded() {
        if isConcluded {
            card.isConcluded = true
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardInformation(name: "Trocando Hobbies", description: "default...", photos: ["name"]))
    }
}
