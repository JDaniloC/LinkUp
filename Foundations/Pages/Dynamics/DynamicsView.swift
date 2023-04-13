//
//  DynamicsView.swift
//  Dynamics
//
//  Created by Madu on 30/03/23.
//

import SwiftUI

struct DynamicsView: View {
    @State var scrollView: Bool = false
    
    var body: some View {
        VStack {
            
            if scrollView == false {
                DynamicsCards()
            }
            
            Button(
                action: {
                    scrollView.toggle()
                },
                label: {
                    if scrollView == false {
                        Text("Exibir Dinâmicas")
                    }
            })
            .offset(y: 50)
            
            if scrollView {
                DynamicsCardsScroll()
            }
        }
        .onAppear(perform: {restartValue()})
    }
    
    func restartValue() {
        scrollView = false
    }
}


struct DynamicsView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsView()
    }
}
