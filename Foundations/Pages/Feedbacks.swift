//
//  Feedbacks.swift
//  Foundations
//
//  Created by Andre on 08/04/23.
//

import SwiftUI

struct FeedBackEntry: Hashable {
    var user: String
    var image: String
    var comment: String
}

struct Feedbacks: View {
    let sampleData: [FeedBackEntry] = [
        FeedBackEntry(user: "Lisa Mello", image: "lisa-mello", comment: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?"),
        FeedBackEntry(user: "Kiev Gama", image: "kiev-gama", comment: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?")
        ]
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Feedbacks")
                .font(.title)
            ForEach(sampleData, id: \.self) { datum in
                VStack (spacing: 10) {
                    HStack (spacing: 10) {
                        ProfileCircle(datum.image, profileName: datum.user)
                            .padding(20)
                        Text(datum.comment)
                            .font(.footnote)
                            .padding(20)
                    }
                }
            }
        }
        .background(.orange)
        .previewLayout(.fixed(width: 300, height: 60))
    }
}

struct Feedbacks_Previews: PreviewProvider {
    static var previews: some View {
        Feedbacks()
    }
}
