//
//  DynamicStatusBar.swift
//  Foundations
//
//  Created by Jailson Soares da Silva Júnior on 26/04/23.
//

import SwiftUI

struct DynamicStatus: View {
    
    
    @State private var statusBar = statusBarModel()
    @State private var toggleChangeStatus = false
    
    var body: some View {
            HStack{
                if toggleChangeStatus{
                    TextField("", text: $statusBar.status)
                        .frame(minWidth: 30)
                        .fixedSize()
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color("card-color")))
                        .textInputAutocapitalization(.never)
                        .onSubmit {
                            toggleChangeStatus = !toggleChangeStatus
                        }
                }else{
                    Text(statusBar.status)
                }

                Button {
                    toggleChangeStatus = !toggleChangeStatus
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        
        
    }
    
   
}

