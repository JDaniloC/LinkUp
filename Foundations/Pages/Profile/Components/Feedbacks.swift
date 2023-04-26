//
//  Feedbacks.swift
//  Foundations
//
//  Created by Andre on 08/04/23.
//

import SwiftUI

struct Feedbacks: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack (spacing: 10) {
            ForEach(viewModel.profile.feedbacks, id: \.self) { datum in
                Divider()
                    .frame(height: 1)
                    .overlay(Color("stroke"))
                HStack (alignment: .top, spacing: 16) {
                    ProfileCircle(
                        datum.image,
                        radius: 86
                    )
                    Text(datum.text)
                        .foregroundColor(
                            Color("black-color"))
                        .font(.inter(.regular, size: 14))
                }.padding(.vertical, 3)
            }
        }.padding(.horizontal, 10)
    }
}

struct Feedbacks_Previews: PreviewProvider {
    @StateObject static var viewModel: ProfileViewModel = ProfileViewModel()

    static var previews: some View {
        Feedbacks().environmentObject(viewModel)
    }
}
