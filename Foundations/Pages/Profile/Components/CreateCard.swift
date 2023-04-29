//
//  CreateCard.swift
//  Foundations
//
//  Created by Jailson Soares da Silva Júnior on 13/04/23.
//

import SwiftUI

struct CreateCard: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    @FocusState private var focus: CreateCardFields?
    let placeholdString = "Digite alguma coisa..."
    
    func finishForm() {
        let text = viewModel.textEditInfo.text
        let title = viewModel.textEditInfo.title
        let isAbleToFinish: Bool = text != "" &&
                                   title != "" &&
                                   text != placeholdString
        if isAbleToFinish {
            viewModel.addCard(card: viewModel.textEditInfo)
            viewModel.setEditInfo(title: "", text: "Digite alguma coisa...")
            viewModel.setIsEditingCard(newValue: false)
            viewModel.toggleCreatingNewCard()
        }
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            VStack(){
                HStack(alignment: .center){
                    Button("Cancelar", action: {
                        viewModel.toggleCreatingNewCard()
                    })
                    .padding()
                    Spacer()
                    Button(viewModel.isEditingCard ? "Editar" : "Criar",
                    action:{
                        finishForm()
                    })
                    .padding()
                }
                TextField("Título", text: $viewModel.textEditInfo.title)
                    .focused($focus, equals: .title)
                    .font(.system(size:36, weight:.bold, design: .default))
                    .foregroundColor(.black)
                    .padding()
                
                TextEditor(text: $viewModel.textEditInfo.text)
                    .focused($focus, equals: .description)
                    .foregroundColor(viewModel.textEditInfo.text == placeholdString ?
                                     Color(uiColor: .placeholderText):
                                     Color(.black))
                    .font(.system(size:22))
                    .padding()
                    .scrollContentBackground(.hidden)
                    .onTapGesture {
                        if viewModel.textEditInfo.text == placeholdString {
                            viewModel.setEditInfo(
                                title: viewModel.textEditInfo.title,
                                text: ""
                            )
                        }
                    }
                   
            }
        }.background(GradientBackground())
    }
}

struct CreateCard_Previews: PreviewProvider {
    @StateObject static var viewModel: ProfileViewModel = ProfileViewModel()

    static var previews: some View {
        CreateCard().environmentObject(viewModel)
    }
}
