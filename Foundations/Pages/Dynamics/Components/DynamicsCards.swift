//
//  DynamicsCards.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicsCards: View {
    @EnvironmentObject var viewModel: DynamicsViewModel
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(viewModel.cards.filter{ filterFunc(card: $0) }) { card in
                    let infos = viewModel.getCardNIndex(cardID: card.id)
                    CardView(card: card)
                        .offset(card.offset)
                        .offset(y: infos.index < 3 ?
                                CGFloat(infos.index) * -45.0 :
                                CGFloat(2) * -45.0
                        ).rotationEffect(.degrees(Double(card.offset.width / 10)))
                        .highPriorityGesture(
                            dragGesture(card: card, infos: infos)
                        )
                }
            }.offset(y: 50)
            Spacer()
        }
    }
    
    func filterFunc(card: DynamicsInfos) -> Bool {
        return viewModel.filter == "" || card.participantsNames.contains(viewModel.filter)
    }
    
    func dragGesture(card: DynamicsInfos,
                     infos: (selectedCard: DynamicsInfos, index: Int)
    ) -> _EndedGesture<_ChangedGesture<DragGesture>> {
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
                    if card.isConcluded {
                        viewModel.remove(index: infos.index)
                    }
                }
            }
    }
}

struct DynamicsCards_Previews: PreviewProvider {
    @StateObject static var viewModel = DynamicsViewModel()
    @StateObject static var relationsModel = RelationshipsViewModel()

    static var previews: some View {
        DynamicsCards()
            .environmentObject(viewModel)
            .environmentObject(relationsModel)
    }
}
