//
//  CreateCard.swift
//  Foundations
//
//  Created by Jailson Soares da Silva Júnior on 13/04/23.
//

import SwiftUI

struct CreateCard: View {
    let placeholdString = "Digite alguma coisa..."
    @EnvironmentObject var viewModel: ProfileViewModel
    
    @Binding var isShowing: Bool
    @State private var cardTitle: String = ""
    @FocusState private var focus: CreateCardFields?
    @State private var cardText: String = "Digite alguma coisa..."
    
    func finishForm() {
        if cardTitle != "" &&
            cardText != "" &&
            cardText != "Digite alguma coisa..." {
            viewModel.addCard(
                title: cardTitle,
                text: cardText
            )
            cardTitle = ""
            cardText = "Digite alguma coisa..."
            isShowing.toggle()
        }
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            VStack(){
                HStack(alignment: .center){
                    Button("Cancelar", action: {
                        isShowing.toggle()
                    })
                    .padding()
                    Spacer()
                    Button("Criar", action:{
                        finishForm()
                    })
                    .padding()
                }
                TextField("Título", text: $cardTitle)
                    .focused($focus, equals: .title)
                    .font(.system(size:36, weight:.bold, design: .default))
                    .foregroundColor(.black)
                    .padding()
                
                TextEditor(text: $cardText)
                    .focused($focus, equals: .description)
                    .foregroundColor(cardText == placeholdString ?
                                     Color(uiColor: .placeholderText):
                                     Color(.black))
                    .font(.system(size:22))
                    .padding()
                    .scrollContentBackground(.hidden)
                    .onTapGesture {
                        if cardText == placeholdString {
                            cardText = ""
                        }
                    }
                   
            }
        }.background(GradientBackground())
    }
}

struct CreateCard_Previews: PreviewProvider {
    static var previews: some View {
        @State var isShowing: Bool = true;
        @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
        CreateCard(isShowing: $isShowing).environmentObject(viewModel)
    }
}
