//
//  DynamicsView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

struct DynamicsView: View {
    @State var scrollView: Bool = false
    @EnvironmentObject var profileVM: ProfileViewModel
    @EnvironmentObject var dynamicsVM: DynamicsViewModel
    
    var body: some View {
        VStack {
            List {
                Picker(selection: $dynamicsVM.filter,
                       label: Image(
                        systemName: "line.3.horizontal.decrease.circle"
                       ).foregroundColor(.accentColor)
                ) {
                    ForEach(dynamicsVM.participants, id: \.self) { name in
                        HStack {
                            Text(name == profileVM.profile.name ? "Todos" : name)
                        }
                    }
                }.pickerStyle(.menu)
            }.frame(height: 50).listStyle(.inset)

            Button(action: { scrollView.toggle() },
                   label: { Text(scrollView ?
                                 "Empilhar Dinâmicas" :
                                 "Desempilhar Dinâmicas") }
            ).offset(y: 50)

            if !scrollView {
                DynamicsCards()
            } else {
                DynamicsCardsScroll()
                    .offset(y: 50)
            }
            Spacer()
        }
        .onAppear(perform: {scrollView = false})
    }
}

struct DynamicsView_Previews: PreviewProvider {
    @StateObject static var relationsVM = RelationshipsViewModel()
    @StateObject static var dynamicsVM = DynamicsViewModel()
    @StateObject static var profileVM = ProfileViewModel()

    static var previews: some View {
        DynamicsView()
            .environmentObject(relationsVM)
            .environmentObject(dynamicsVM)
            .environmentObject(profileVM)
    }
}
