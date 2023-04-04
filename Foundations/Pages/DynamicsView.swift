//
//  DynamicsView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

class CardsList: ObservableObject {
    @Published var cards: [CardInformation] = [
        CardInformation(name: "Verdade ou Mentira"),
        CardInformation(name: "Trocando Hobbies"),
        CardInformation(name: "Compartilhando Histórias")
    ]

    func add(card: CardInformation) {
        self.cards.insert(card, at: 0)
    }

    func remove(index: Int) {
        self.cards.remove(at: index)
    }
    
    func getCardNIndex(cardID: UUID) -> (selectedCard: CardInformation, index: Int) {
        var selectedCard = CardInformation(name: "default")
        var index = 0
        
        for (i, card) in self.cards.enumerated() {
            if (card.id == cardID) {
                selectedCard = card
                index = i
            }
        }
        return (selectedCard, index)
    }
    
    func setCardOffset(cardID: UUID, newOffset: CGSize) {
        var infos = getCardNIndex(cardID: cardID)
        
        infos.selectedCard.setOffset(newOffset: newOffset)
        self.cards[infos.index] = infos.selectedCard
    }
}

struct DynamicsView: View {
    @StateObject var viewModel: CardsList = CardsList()


    var body: some View {

        ZStack {
            ForEach(viewModel.cards) { card in
                let infos = viewModel.getCardNIndex(cardID: card.id)
                CardView(card: card)
                    .offset(card.offset)
                    .offset(y: infos.index < 3 ? CGFloat(infos.index) * -45.0 : -40.0)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                viewModel.setCardOffset(
                                    cardID: card.id,
                                    newOffset: value.translation
                                )
                                print(value.translation)

                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    viewModel.setCardOffset(cardID: card.id, newOffset: .zero)
                                    if card.offset.height < -130 {
                                        let infos = viewModel.getCardNIndex(cardID: card.id)
                                        viewModel.remove(index: infos.index)
                                        viewModel.add(card: infos.selectedCard)
                                        
                                    }
                                }
                            }
                    )
            }
        }

    }
}


struct DynamicsView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsView()
    }
}
