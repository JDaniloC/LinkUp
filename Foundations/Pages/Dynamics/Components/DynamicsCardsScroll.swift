//
//  DynamicsCardsScroll.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicsCardsScroll: View {
    @Binding var scrollView: Bool
    @EnvironmentObject var viewModel: DynamicsViewModel
    
    var body: some View {
        
        Button(
            action: {
                scrollView.toggle()
            },
            label: {
                Text("Empilhar Cards")
        })
        .offset()
        
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(viewModel.cards.reversed()) { card in
                    CardView(card: card)
                        .padding(5)
                }
            }
        }
    }
}
