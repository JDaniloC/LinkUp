//
//  DynamicsCardsScroll.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicsCardsScroll: View {
    @EnvironmentObject var viewModel: DynamicsViewModel
    
    func filterFunc(card: DynamicsInfos) -> Bool {
        return viewModel.filter == "" ||
            card.participantsNames.contains(viewModel.filter)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.cards.reversed().filter(filterFunc)) { card in
                    CardView(card: card)
                        .padding(5)
                }
            }
        }
    }
}

struct DynamicsCardScrollPreviews: PreviewProvider {
    @StateObject static var dynamicsVM = DynamicsViewModel()
    @StateObject static var relationsVM = RelationshipsViewModel()

    static var previews: some View {
        DynamicsCardsScroll()
            .environmentObject(relationsVM)
            .environmentObject(dynamicsVM)
    }
}

