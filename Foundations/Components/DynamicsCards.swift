//
//  DynamicsCards.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

class CardsList: ObservableObject {
    @Published var cards: [CardInformation] = [
        CardInformation(name: "Verdade ou Mentira", description: "descrição default da verdade ou mentira Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", photos: ["profile", "kiev-gama", "lisa-mello"]),
        CardInformation(name: "Trocando Hobbies", description: "descrição default trocando hobbies", photos: ["name"]),
        CardInformation(name: "Compartilhando Histórias", description: "descrição default compartilhando histórias", photos: ["name"]),
        CardInformation(name: "Resolvendo Conflitos", description: "descrição default resolvendo comflitos", photos: ["name"]),
        CardInformation(name: "Ilha Deserta", description: "descrição default da ilha deserta", photos: ["name"])
    ].filter{!$0.isConcluded}.reversed()

    func add(card: CardInformation) {
        self.cards.insert(card, at: 0)
    }

    func remove(index: Int) {
        self.cards.remove(at: index)
    }
    
    func getCardNIndex(cardID: UUID) -> (selectedCard: CardInformation, index: Int) {
        var selectedCard = CardInformation(name: "default", description: "default", photos: ["default"])
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
        let infos = getCardNIndex(cardID: cardID)
        infos.selectedCard.offset = newOffset
        self.cards[infos.index] = infos.selectedCard
    }
}


struct DynamicsCards: View {
    @StateObject var viewModel: CardsList = CardsList()
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cards) { card in
                let infos = viewModel.getCardNIndex(cardID: card.id)
                CardView(card: card)
                    .offset(card.offset)
                    .offset(y: infos.index < 3 ? CGFloat(infos.index) * -45.0 : CGFloat(2) * -45.0)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged { value in
                                viewModel.setCardOffset(
                                    cardID: card.id,
                                    newOffset: value.translation
                                )
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if card.offset.height < -130 {
                                        let infos = viewModel.getCardNIndex(cardID: card.id)
                                        viewModel.remove(index: infos.index)
                                        viewModel.add(card: infos.selectedCard)
                                    }
                                    viewModel.setCardOffset(cardID: card.id, newOffset: .zero)
                                }
                            }
                    )
            }
        }
        .offset(y: 50)
    }
}

struct DynamicsCards_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsCards()
    }
}
