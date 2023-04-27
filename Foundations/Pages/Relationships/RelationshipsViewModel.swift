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
            name: "Juliano Paes",
            image: "juliano-paes",
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
    
    @Published var nodes: [Node] = []
    
    init() {
        self.getPositions()
    }
    
    func setRelationships(newRelationships: [Profile]) {
        self.relationships = newRelationships
        getPositions()
    }
    
    func getRelationByNode(node: Node) -> Profile {
        for relation in relationships {
            if (node.name == relation.name) {
                return relation
            }
        }
        return relationships[0]
    }
    
    func getPositions() {
        var nodes: [Node] = []
        let center: CGPoint = CGPoint(x: 0.5, y: 0.5)
        
        let angle = 2 * Double.pi / Double(relationships.count)
        for i in 0..<relationships.count {
            var x = 0.5 * cos(angle * Double(i)) + center.x
            var y = 0.5 * sin(angle * Double(i)) + center.y
            
            let newDistance = Double.random(in: 0.8...1)
            let d = sqrt(pow(center.x - x, 2) +
                         pow(center.y - y, 2))
            x = x + (newDistance / d) * (center.x - x)
            y = y + (newDistance / d) * (center.y - y)
            
            let relation = relationships[i];
            let node: Node = Node(
                id: UUID(),
                name: relation.name,
                image: relation.image,
                position: CGPoint(x: x, y: y)
            )
            nodes.append(node)
        }
        self.nodes = nodes
    }
}
