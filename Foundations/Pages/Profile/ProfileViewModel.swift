//
//  ProfileViewModel.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 05/04/23.
//  
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = Profile(
        name: "Alice Diniz",
        image: "profile",
        status: "Estou me sentindo... Cansada",
        cardList: [
            CardInfo(
                text: "Feedbacks",
                title: "Feedbacks",
                description: "Confira o que as pessoas pensam de você"
            ),
            CardInfo(
                text: """
                Fui ao supermercado fazer umas compras e, chegando lá, lembrei-me de que precisava de uma vassoura nova. Peguei tudo o que queria comprar e fui ao caixa. Quando passei a vassoura, a funcionária perguntou:
                – Vai levar montada?
                Sem perceber que ela se referia à conexão entre o cabo e a ponta da vassoura, respondi, brincando:
                    – Não! Tenho medo de altura, prefiro caminhar!
                """,
                title: "História",
                description: "Confira a história que você está compartilhando"
            ),
            CardInfo(
                text: "Com esse projeto espero aprender a fazer animações com o figma e aprender o básico de programação.",
                title: "Objetivos",
                description: "Confira os objetivos que você está compartilhando"
            ),
            CardInfo(
                text: """
                - Preparar o almoço;
                - Buscar minha sobrinha no colégio;
                - Levar o Toby para passear;
                - Enviar a documentação por email;
                - Ajeitar o relógio da parede de vovó;
                """,
                title: "Tarefas diárias",
                description: "Confira suas tarefas diárias"
            )
        ],
        feedbacks: [
            Feedback(
                name: "Lisa Mello",
                text: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?",
                image: "lisa-mello"
            ),
            Feedback(
                name: "Kiev Gama",
                text: "Parabéns! Vi que você vem trabalhando há tempos para construir essa conquista. Na minha opinião o que te levou até ela foi sua determinação e como você lida com erros, e na sua?",
                image: "kiev-gama"
            )
        ]
    )
    @Published var textCardInfo: TextCardInfo = TextCardInfo(
        title: "", text: "")
    
    public func setProfileData(newProfile: Profile) {
        self.profile = newProfile
    }
    
    public func setTextCardInfo(card: CardInfo) {
        textCardInfo.title = card.title
        textCardInfo.text = card.text
    }
    
    public func addCard(title: String, text: String) {
        self.profile.cardList.append(CardInfo(
            text: text, title: title, description: text
        ))
    }
}
