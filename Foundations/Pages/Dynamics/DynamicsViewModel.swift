//
//  DynamicsViewModel.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

final class DynamicsViewModel: ObservableObject {
    @Published var cards: [CardInformation] = [
        CardInformation(
            name: "Fatos Pessoais",
            description: "Cada membro deve compartilhar três fatos pessoais sobre si mesmo, sendo que um deles é falso. Os outros membros devem tentar adivinhar qual é o fato falso.",
            photos: ["profile", "kiev-gama", "juliano-paes"]
        ),

        CardInformation(
            name: "Apresentação rápida",
            description: "Cada membro tem 30 segundos para se apresentar, falando sobre quem são, suas habilidades e experiências.",
            photos: ["profile", "juliano-paes"]
        ),

        CardInformation(
            name: "Desafio das fotos",
            description: "Cada membro deve trazer uma foto de quando era criança e contar um pouco sobre sua história e como essa foto representa um momento importante de sua vida.",
            photos: ["profile", "kiev-gama"]
        ),

        CardInformation(
            name: "Bingo de Perguntas",
            description: "Crie um cartão de bingo com perguntas sobre as experiências e habilidades de cada membro. Os membros devem circular as perguntas que são verdadeiras sobre eles.",
            photos: ["profile", "juliano-paes"]
        ),

        CardInformation(
            name: "Eu nunca",
            description: "Cada membro deve fazer uma afirmação começando com 'Eu nunca...', como por exemplo 'Eu nunca viajei para outro país'. Os membros que já fizeram o que foi dito devem levantar a mão e compartilhar sua experiência.",
            photos: ["profile"]
        ),
        CardInformation(
            name: "Papel Higiênico",
            description: "Cada membro deve pegar um rolo de papel higiênico e rasgar a quantidade que acha que usaria em um dia normal. Depois, para cada folha rasgada, deve compartilhar uma informação pessoal com o grupo.",
            photos: ["profile", "lisa-mello"]
        ),

        CardInformation(
            name: "Post-it",
            description: "Cada membro recebe uma quantidade de post-its e deve escrever um fato pessoal em cada um deles. Em seguida, devem colá-los nas costas dos outros membros, sem que eles vejam o que está escrito. Cada um deve tentar adivinhar o que está escrito em seu post-it, fazendo perguntas aos outros membros.",
            photos: ["profile", "kiev-gama"]
        ),

        CardInformation(
            name: "Desafio da Comida",
            description: "Cada membro deve trazer um prato de sua preferência para compartilhar com o grupo. Antes de começar a comer, devem contar a história por trás do prato e como ele se tornou um de seus favoritos.",
            photos: ["profile", "lisa-mello"]
        ),

        CardInformation(
            name: "Passado",
            description: "Cada membro deve trazer um objeto que tenha um significado especial para ele e compartilhar com o grupo a história por trás desse objeto. Pode ser desde um brinquedo de infância até um item de coleção.",
            photos: ["profile", "juliano-paes"]
        ),

        CardInformation(
            name: "História",
            description: "Cada membro deve escrever um pedaço de uma história em um pedaço de papel, sem que os outros membros vejam. Em seguida, os papéis são misturados e cada membro deve escolher um papel e continuar a história por mais algumas frases. O resultado final é uma história coletiva, criada por todos os membros do grupo.",
            photos: ["profile", "kiev-gama", "juliano-paes"]
        ),


        
    ].filter{!$0.isConcluded}.reversed()

    func add(card: CardInformation) {
        self.cards.insert(card, at: 0)
    }

    func remove(index: Int) {
        self.cards.remove(at: index)
    }
    
    func removeAndGetParticipants() -> [String] {
        let removedList = self.cards.filter{$0.isConcluded}
        if (removedList.isEmpty) {
            return []
        }
        let removedCard = removedList[0]
        self.cards = self.cards.filter{!$0.isConcluded}
        return removedCard.participants
    }
    
    func getCardNIndex(cardID: UUID) -> (selectedCard: CardInformation, index: Int) {
        var selectedCard = CardInformation(name: "default", description: "default", photos: ["default"])
        var index = 0
        
        for (i, card) in self.cards.enumerated() {
            if (card.id == cardID) {
                selectedCard = card
                index = i
            }
        }
        return (selectedCard, index)
    }
    
    func setCardOffset(cardID: UUID, newOffset: CGSize) {
        let infos = getCardNIndex(cardID: cardID)
        infos.selectedCard.offset = newOffset
        self.cards[infos.index] = infos.selectedCard
    }
}
