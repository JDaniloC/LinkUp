//
//  DynamicsCardsScroll.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicsCardsScroll: View {
    @EnvironmentObject var viewModel: CardsList
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.cards.reversed()) { card in
                    CardView(card: card)
                        .padding(5)
                }
            }
        }
        //.padding(.top)
    }
}

struct DynamicsCardsScroll_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsCardsScroll()
    }
}
