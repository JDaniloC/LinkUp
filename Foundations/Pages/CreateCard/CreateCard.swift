//
//  CreateCard.swift
//  Foundations
//
//  Created by Jailson Soares da Silva Júnior on 13/04/23.
//

import SwiftUI

struct CreateCard: View {
    let placeholdString = "Digite alguma coisa..." //how to set this constant content in cardContext?
    
    @State private var cardTitle: String = ""
    @State private var cardText: String = "Digite alguma coisa..."
    
    
    var body: some View{
        ZStack(alignment: .topLeading){
            BackgroundView()
            VStack(){
                HStack(alignment: .center){
                    Button{
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    .padding()
                    Spacer()
                    Button("Salvar", action:{
                    })
                    .padding()
                   
                }
                TextField("Título", text: $cardTitle)
                    .font(.system(size:36, weight:.bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    
                
                TextEditor(text: $cardText)
                    .foregroundColor(cardText == placeholdString ? Color(uiColor: .placeholderText) : Color(.black))
                    .font(.system(size:22))
                    .padding()
                    .scrollContentBackground(.hidden)
                    .onTapGesture {
                        if cardText == placeholdString {
                            cardText = ""
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
}


#if canImport(UIkit)
extension View{
    func hideKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
