//
//  DynamicDescriptionPage.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicDescriptionPage: View {
    @Binding var isModalOpen: Bool
    var title: String = "Title"
    var description: String = "descrição default da verdade ou mentira Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    var photos: [String] = ["profile"]
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    isModalOpen.toggle()
                }, label: {
                    Image(systemName: "chevron.left")
                    Text("Voltar")
                })
                .padding(.leading)
                Spacer()
            }
            
            Text(title)
                .font(.largeTitle)
                .padding(.top, 80)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Descrição")
                    .font(.title)
                Text(description)
                
                Text("Participam da dinâmica")
                    .font(.title)
                HStack(alignment: .top) {
                    ForEach(photos, id: \.self) {photo in
                        ProfileCircle(photo, radius: 50)
                    }
                }
            }
            .padding()
            Spacer()
            
            Button(action: {
                print("hii")
            }, label: {
                Text("Concluir")
                    .padding([.bottom, .top], 8)
                    .padding([.leading, .trailing], 140)
            })
            .padding(.bottom)
            .buttonStyle(.borderedProminent)
        }
        .background(LinearGradient(
            gradient: Gradient(
                colors: [
                    Color(red: 255/255, green: 233/255, blue: 204/255),
                    .white, .white, .white, .white
                ]
            ),
            startPoint: .top, endPoint: .bottom
        ))
    }
    
//    struct DynamicDescriptionPage_Previews: PreviewProvider {
//        static var previews: some View {
//            DynamicDescriptionPage()
//        }
//    }
}
