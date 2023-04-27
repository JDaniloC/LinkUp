//
//  CardView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

struct CardView: View {
    var card: CardInformation
    @EnvironmentObject var relationsVM: RelationshipsViewModel
    
    func finishDynamic() {
        let imageList = viewModel.removeAndGetParticipants()
        relationsVM.updateBonds(imageList: imageList)
    }

    @EnvironmentObject var viewModel: DynamicsViewModel
    @State private var offset = CGSize.zero
    @State private var isModalOpen = false
    @State private var isConcluded = false
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
                    .foregroundColor(Color(
                        red: 90/255,
                        green: 90/255,
                        blue: 90/255
                    ))
            }
            .fullScreenCover(isPresented: $isModalOpen) {
                DynamicDescriptionPage(isModalOpen: $isModalOpen,
                                       isConcluded: $isConcluded,
                                       title: card.name,
                                       description: card.description,
                                       photos: card.participants)
                    .onDisappear(perform: {
                        card.isConcluded = isConcluded
                        finishDynamic()
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
    @StateObject static var viewModel: DynamicsViewModel = DynamicsViewModel()

    static var previews: some View {
       CardView(card: CardInformation(
           name: "Trocando Hobbies",
           description: "Descrição exemplo do Trocando Hobbies",
           photos: ["profile"]
       )).environmentObject(viewModel)
   }
}
