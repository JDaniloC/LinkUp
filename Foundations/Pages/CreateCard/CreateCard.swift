//
//  CreateCard.swift
//  Foundations
//
//  Created by Jailson Soares da Silva Júnior on 13/04/23.
//

import SwiftUI

struct CreateCard: View {
    @State private var cardTitle: String = ""
    @State private var cardText: String = ""
    
    var body: some View{
        ZStack{
            BackgroundView()
            VStack{
                NavigationStack{
                    TextField("Título...", text: $cardTitle)
                        .font(.system(size:36, weight:.bold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                    
                    TextEditor(text: $cardText)
                        .foregroundColor(Color(.black))
                        .padding(.horizontal)
                }
            }
        }
    }
    
}


struct BackgroundView: View{
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[Color("stroke"),.white]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
    
}


struct CreateCard_Previews: PreviewProvider {
    static var previews: some View {
        CreateCard()
    }
}
