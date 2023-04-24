//
//  DynamicsView.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

struct DynamicsView: View {
    @State var scrollView: Bool = false
    @StateObject var viewModel: DynamicsViewModel = DynamicsViewModel()
    
    var body: some View {
        VStack() {
            DynamicsProgress()
            
            Spacer()

            if !scrollView {
                DynamicsCards()
                Button(
                    action: {
                        scrollView.toggle()
                    },
                    label: {
                        Text("Exibir Dinâmicas")
                })
                .offset(y: 52)
            } else {
                DynamicsCardsScroll()
            }
            
            Spacer()
            Spacer()
        }
        .onAppear(perform: {scrollView = false})
        .environmentObject(viewModel)
    }
}

struct DynamicsView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsView()
    }
}
