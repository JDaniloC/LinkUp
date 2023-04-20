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
    @EnvironmentObject var viewModel: CardsList
    
    @State var width: CGFloat = 350
    @State var height: CGFloat = 235

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color("card-color"),
                            .white
                        ]
                    ),
                    startPoint: .top, endPoint: .bottom
                 ))
                .frame(width: width, height: height)
                .onTapGesture {
                    isModalOpen.toggle()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("light-yellow"), lineWidth: 5)
                )

            VStack {
                Text(card.name)
                    .font(.title)
                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
            }
            .fullScreenCover(isPresented: $isModalOpen) {
                DynamicDescriptionPage(isModalOpen: $isModalOpen, isConcluded: $isConcluded, title: card.name, description: card.description, photos: card.participants)
                    .onDisappear(perform: {
                        card.isConcluded = isConcluded
                        viewModel.cards = viewModel.cards.filter{!$0.isConcluded}
                    })
            }
        }
    }
    
    mutating func updateSize(width: CGFloat, height: CGFloat) {
        if width != CGFloat(0) {
            self.width = width
            self.height = height
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardInformation(name: "Trocando Hobbies", description: "default...", photos: ["name"]))
    }
}
