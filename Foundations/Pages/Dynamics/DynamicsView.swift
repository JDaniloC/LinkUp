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
        VStack {
            if !scrollView {
                DynamicsCards(scrollView: $scrollView)
            } else {
                DynamicsCardsScroll(scrollView: $scrollView)
                    .offset(y: 50)
            }
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
