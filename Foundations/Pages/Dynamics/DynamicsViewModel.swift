//
//  DynamicsViewModel.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 24/04/23.
//

import SwiftUI

final class DynamicsViewModel: ObservableObject {
    @Published var filter: String = "Alice Diniz"
    @Published var participants: [String] = []
    @Published var cards: [DynamicsInfos] = [
        DynamicsInfos(
            name: "Fatos Pessoais",
            description: "Cada membro deve compartilhar três fatos pessoais sobre si mesmo, sendo que um deles é falso. Os outros membros devem tentar adivinhar qual é o fato falso.",
            participants: [
                Participant(name: "Juliano Paes", image: "juliano-paes"),
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Kiev Gama", image: "kiev-gama")
            ]
        ),

        DynamicsInfos(
            name: "Apresentação rápida",
            description: "Cada membro tem 30 segundos para se apresentar, falando sobre quem são, suas habilidades e experiências.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Juliano Paes", image: "juliano-paes")
            ]
        ),

        DynamicsInfos(
            name: "Desafio das fotos",
            description: "Cada membro deve trazer uma foto de quando era criança e contar um pouco sobre sua história e como essa foto representa um momento importante de sua vida.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Kiev Gama", image: "kiev-gama")
            ]
        ),

        DynamicsInfos(
            name: "Bingo de Perguntas",
            description: "Crie um cartão de bingo com perguntas sobre as experiências e habilidades de cada membro. Os membros devem circular as perguntas que são verdadeiras sobre eles.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Juliano Paes", image: "juliano-paes")
            ]
        ),

        DynamicsInfos(
            name: "Eu nunca",
            description: "Cada membro deve fazer uma afirmação começando com 'Eu nunca...', como por exemplo 'Eu nunca viajei para outro país'. Os membros que já fizeram o que foi dito devem levantar a mão e compartilhar sua experiência.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Juliano Paes", image: "juliano-paes")
            ]
        ),

        DynamicsInfos(
            name: "Papel Higiênico",
            description: "Cada membro deve pegar um rolo de papel higiênico e rasgar a quantidade que acha que usaria em um dia normal. Depois, para cada folha rasgada, deve compartilhar uma informação pessoal com o grupo.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Lisa Mello", image: "lisa-mello")
            ]
        ),

        DynamicsInfos(
            name: "Post-it",
            description: "Cada membro recebe uma quantidade de post-its e deve escrever um fato pessoal em cada um deles. Em seguida, devem colá-los nas costas dos outros membros, sem que eles vejam o que está escrito. Cada um deve tentar adivinhar o que está escrito em seu post-it, fazendo perguntas aos outros membros.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Kiev Gama", image: "kiev-gama")
            ]
        ),

        DynamicsInfos(
            name: "Desafio da Comida",
            description: "Cada membro deve trazer um prato de sua preferência para compartilhar com o grupo. Antes de começar a comer, devem contar a história por trás do prato e como ele se tornou um de seus favoritos.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Lisa Mello", image: "lisa-mello")
            ]
        ),

        DynamicsInfos(
            name: "Passado",
            description: "Cada membro deve trazer um objeto que tenha um significado especial para ele e compartilhar com o grupo a história por trás desse objeto. Pode ser desde um brinquedo de infância até um item de coleção.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Juliano Paes", image: "juliano-paes")
            ]
        ),

        DynamicsInfos(
            name: "História",
            description: "Cada membro deve escrever um pedaço de uma história em um pedaço de papel, sem que os outros membros vejam. Em seguida, os papéis são misturados e cada membro deve escolher um papel e continuar a história por mais algumas frases. O resultado final é uma história coletiva, criada por todos os membros do grupo.",
            participants: [
                Participant(name: "Alice Diniz", image: "profile"),
                Participant(name: "Kiev Gama", image: "kiev-gama"),
                Participant(name: "Lisa Mello", image: "lisa-mello")
            ]
        ),
    ].filter{!$0.isConcluded}.reversed()

    init() {
        self.getParticipants()
    }
    
    func getParticipants() {
        self.participants = Array(Set(self.cards.reduce(
            [], { result, oldOne in result + oldOne.participants.map{ $0.name }
        })))
    }
    
    func add(card: DynamicsInfos) {
        self.cards.insert(card, at: 0)
        self.getParticipants()
    }

    func remove(index: Int) {
        self.cards.remove(at: index)
        self.getParticipants()
    }
    
    func removeAndGetParticipants() -> [String] {
        let removedList = self.cards.filter{$0.isConcluded}
        if (removedList.isEmpty) {
            return []
        }
        let removedCard = removedList[0]
        self.cards = self.cards.filter{!$0.isConcluded}
        self.getParticipants()
        return removedCard.participants.map { $0.name }
    }
    
    func getCardNIndex(cardID: UUID) -> (selectedCard: DynamicsInfos, index: Int) {
        var selectedCard = DynamicsInfos(name: "", description: "", participants: [])
        var index = 0
        
        for (i, card) in self.cards.enumerated() {
            if (card.id == cardID) {
                selectedCard = card
                index = i
                break
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
