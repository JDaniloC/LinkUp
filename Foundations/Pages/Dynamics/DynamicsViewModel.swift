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
            name: "Verdade ou Mentira",
            description: "Desta maneira, o consenso sobre a necessidade de qualificação promove a alavancagem da gestão inovadora da qual fazemos parte. É importante questionar o quanto o aumento do diálogo entre os diferentes setores produtivos facilita a criação das formas de ação. Assim mesmo, a crescente influência da mídia auxilia a preparação e a composição de todos os recursos funcionais envolvidos.",
            photos: ["profile", "kiev-gama", "lisa-mello"]
        ),
        CardInformation(
            name: "Trocando Hobbies",
            description: "Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual oferece uma interessante oportunidade para verificação de alternativas às soluções ortodoxas. O incentivo ao avanço tecnológico, assim como o desafiador cenário globalizado afeta positivamente a correta previsão do orçamento setorial.",
            photos: ["profile", "kiev-gama"]
        ),
        CardInformation(
            name: "Compartilhando Histórias",
            description: "No mundo atual, a competitividade nas transações comerciais desafia a capacidade de equalização dos relacionamentos verticais entre as hierarquias. No entanto, não podemos esquecer que o novo modelo estrutural aqui preconizado prepara-nos para enfrentar situações atípicas decorrentes dos índices pretendidos. ",
            photos: ["profile", "kiev-gama"]
        ),
        CardInformation(
            name: "Resolvendo Conflitos",
            description: "Percebemos, cada vez mais, que o comprometimento entre as equipes obstaculiza a apreciação da importância do sistema de formação de quadros que corresponde às necessidades. Todavia, o entendimento das metas propostas cumpre um papel essencial na formulação do fluxo de informações.",
            photos: ["profile", "lisa-mello"]
        ),
        CardInformation(
            name: "Ilha Deserta",
            description: "A certificação de metodologias que nos auxiliam a lidar com a estrutura atual da organização acarreta um processo de reformulação e modernização do remanejamento dos quadros funcionais.",
            photos: ["lisa-mello", "kiev-gama"]
        )
    ].filter{!$0.isConcluded}.reversed()

    func add(card: CardInformation) {
        self.cards.insert(card, at: 0)
    }

    func remove(index: Int) {
        self.cards.remove(at: index)
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
