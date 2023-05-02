//
//  ProfileCardGrid.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//

import SwiftUI

struct ProfileCardGrid: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State private var showCard: Bool = false

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        LazyVGrid(
            columns: columns,
            spacing: 20
        ) {
            ForEach(viewModel.profile.cardList) { card in
                let myCard = ProfileCard(title: card.title, content: {
                    Text(card.description)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(
                            Color("black-color"))
                        .font(.inter(.regular, size: 15))
                })
                    .onTapGesture {
                        viewModel.setTextCardInfo(card: card)
                        showCard.toggle()
                    }
                
                if viewModel.isMyProfile {
                    if card.title != "Feedbacks" && card.title != "Objetivos" {
                        myCard
                            .contextMenu(menuItems: {
                                Button(
                                    action: {editCard(card)},
                                    label: {Label("Editar", systemImage: "pencil")})
                                Button(
                                    role: .destructive,
                                    action: {deleteCard(card.id)},
                                    label: {Label("Apagar", systemImage: "trash")}
                                )
                            })
                    } else {
                        myCard
                            .contextMenu(menuItems: {
                                Button(
                                    action: {editCard(card)},
                                    label: {Label("Editar", systemImage: "pencil")})
                            })
                    }
                } else { myCard }

            }
        }.padding(.all, 20)
         .sheet(isPresented: $showCard) {
             ProfileCardView($viewModel.textCardInfo.title) {
                 if viewModel.textCardInfo.title == "Feedbacks" {
                     Feedbacks()
                 } else {
                     Text(viewModel.textCardInfo.text)
                         .foregroundColor(Color("black-color"))
                         .font(.inter(.regular, size: 20))
                         .padding(.horizontal, 20)
                 }
             }.presentationDragIndicator(.hidden)
             .presentationDetents([.medium, .large])
         }
    }
    
    func deleteCard(_ idToBeDeleted: UUID) {
        viewModel.profile.cardList = viewModel.profile.cardList.filter(){$0.id != idToBeDeleted}
    }
    
    func editCard(_ cardInfo: CardInfo) {
        deleteCard(cardInfo.id)
        viewModel.setEditInfo(title: cardInfo.title, text: cardInfo.text)
        viewModel.setIsEditingCard(newValue: true)
        viewModel.toggleCreatingNewCard()
    }
}

struct ProfileCardGrid_Previews: PreviewProvider {
    @StateObject static var viewModel: ProfileViewModel = ProfileViewModel()

    static var previews: some View {
        ProfileCardGrid().environmentObject(viewModel)
    }
}
