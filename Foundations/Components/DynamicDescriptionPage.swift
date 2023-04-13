//
//  DynamicDescriptionPage.swift
//  Foundations
//
//  Created by Madu on 05/04/23.
//

import SwiftUI

struct DynamicDescriptionPage: View {
    var title: String = ""
    var description: String = ""
    var photos: [String] = ["profile"]
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 255/255, green: 233/255, blue: 204/255),
                                .white
                            ]
                        ),
                        startPoint: .top, endPoint: .bottom
                     ))
                    .frame(height: 230)
                Spacer()
            }
            VStack {
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
                .padding()
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct DynamicDescriptionPage_Previews: PreviewProvider {
    static var previews: some View {
        DynamicDescriptionPage()
    }
}
