//
//  FeedbackCard.swift
//  Foundations
//
//  Created by André Carneiro de Albuquerque Santana Filho on 30/03/23.
//

import SwiftUI

struct FeedBackEntry {
    var user: String
    var comment: String
    var profile: ProfileCircle
}

extension FeedBackEntry {
    static let sampleData: [FeedBackEntry] = [
        FeedBackEntry(user: "Lisa Mello", comment: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?", profile: ProfileCircle(imagePath:"lisa-mello", profileName: "Lisa Mello")),
        FeedBackEntry(user: "Kiev Gama", comment: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?", profile: ProfileCircle(imagePath:"kiev-gama", profileName: "Kiev Gama"))
    ]
}

struct FeedbackCard: View {
    let feedbackCard: FeedBackEntry
    var body: some View {
        VStack {
            HStack (spacing: 10) {
                feedbackCard.profile
                    .padding(20)
                Text(feedbackCard.comment)
                    .font(.footnote)
                    .padding(20)
            }
        }
    }
}

struct FeedbackCard_Previews: PreviewProvider {
    static var cards = FeedBackEntry.sampleData
    static var previews: some View {
        VStack(spacing: 10) {
            Text("Feedbacks")
                .font(.title)
            FeedbackCard(feedbackCard: cards[0])
        }
        .background(.orange)
        .previewLayout(.fixed(width: 300, height: 60))
    }
}
