//
//  RelationshipsViewModel.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 12/04/23.
//

import SwiftUI

final class RelationshipsViewModel: ObservableObject {
    @Published var relationships: [Profile] = [
        Profile(
            name: "Kiev Gama",
            image: "kiev-gama",
            status: "Estou me sentindo... Focado",
            cardList: [
                CardInfo(
                    text: """
                    Fui ao supermercado fazer umas compras e, chegando lá, lembrei-me de que precisava de uma vassoura nova. Peguei tudo o que queria comprar e fui ao caixa. Quando passei a vassoura, a funcionária perguntou:
                    – Vai levar montada?
                    Sem perceber que ela se referia à conexão entre o cabo e a ponta da vassoura, respondi, brincando:
                        – Não! Tenho medo de altura, prefiro caminhar!
                    """,
                    title: "História",
                    description: "Confira a história que você está compartilhando"
                )
            ],
            feedbacks: []
        ),
        Profile(
            name: "Lisa Mello",
            image: "lisa-mello",
            status: "Estou me sentindo... Muito bem!",
            cardList: [
                CardInfo(
                    text: "Com esse projeto espero aprender a fazer animações com o figma e aprender o básico de programação.",
                    title: "Objetivos",
                    description: "Confira os objetivos que você está compartilhando"
                )
            ],
            feedbacks: []
        )
    ]
}
