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
    let participants: [String]
    private var _offset: CGSize = .zero
    
    init(name: String, description: String, photos: [String]) {
        self.name = name
        self.description = description
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
                .frame(width: 380, height: 250)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 255/255, green: 244/255, blue: 228/255), lineWidth: 5)
                )

            VStack {
                Text(card.name)
                    .font(.title)
                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
                
                Button {
                    
                    isModalOpen.toggle()
                } label: {
                    Image(systemName: "chevron.right")
                }
                .dynamicTypeSize(.xxxLarge)
                .offset(x: 140, y: 70)
            }
            .sheet(isPresented: $isModalOpen, content: {
                DynamicDescriptionPage(title: card.name, description: card.description, photos: card.participants)
            })
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardInformation(name: "default", description: "default...", photos: ["name"]))
    }
}
