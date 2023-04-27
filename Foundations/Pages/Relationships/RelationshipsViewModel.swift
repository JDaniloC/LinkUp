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
            status: "Focado",
            cardList: [
                CardInfo(
                    text: """
                    Fui ao supermercado fazer umas compras e, chegando lá, lembrei-me de que precisava de uma vassoura nova. Peguei tudo o que queria comprar e fui ao caixa. Quando passei a vassoura, a funcionária perguntou:
                    – Vai levar montada?
                    Sem perceber que ela se referia à conexão entre o cabo e a ponta da vassoura, respondi, brincando:
                        – Não! Tenho medo de altura, prefiro caminhar!
                    """,
                    title: "História",
                    description: "Confira a história compartilhada"
                )
            ],
            feedbacks: []
        ),
        Profile(
            name: "Juliano Paes",
            image: "juliano-paes",
            status: "inspirado",
            cardList: [
                CardInfo(
                    text: """
                    Eu espero que este projeto seja uma oportunidade para aprender coisas novas e expandir minhas habilidades, enquanto trabalhamos em conjunto para criar algo que realmente faça a diferença.
                    """,
                    title: "Objetivo",
                    description: "Confira o objetivo"
                ),
                CardInfo(
                    text: """
                    Atualmente estou lendo O Guia do Mochileiro das Galáxias.
                    O mais maneiro é que o livro é tipo uma crítica muito engraçada e inteligente à nossa sociedade, sabe? Tipo, é tudo uma grande piada mas ao mesmo tempo faz você pensar em algumas coisas...tô curtindo demais! Se vc já leu, vamos converar sobre!!!
                    """,
                    title: "Leitura Atual",
                    description: "Confira a leitura compartilhada"
                ),
                CardInfo(
                    text: """
                    1. nenhum
                    """,
                    title: "Gatos mais bonitos que o meu",
                    description: "Confira os 'gatos mais bonitos que o meu' compartilhada"
                )
            ],
            feedbacks: []
        ),
        Profile(
            name: "Lisa Mello",
            image: "lisa-mello",
            status: "Muito bem!",
            cardList: [
                CardInfo(
                    text: "Com esse projeto espero aprender a fazer animações com o figma e aprender o básico de programação.",
                    title: "Objetivos",
                    description: "Confira os objetivos compartilhado"
                ),
                CardInfo(
                    text:  """
                    Uma das minhas paixões é a fotografia. Adoro explorar lugares novos e capturar momentos únicos com a minha câmera. Além disso, também gosto de editar minhas fotos para deixá-las ainda mais bonitas e compartilhá-las nas redes sociais.

                    Outro hobby que me dá muito prazer é a leitura. Eu amo me perder em histórias e viajar para outros mundos através das páginas dos livros. Tenho uma estante cheia de títulos diferentes e adoro descobrir novos autores e gêneros literários.
                    """,
                    title: "Paixões",
                    description: "Confira as paixões compartilhadas"
                ),
                CardInfo(
                    text:  """
                        Ao longo dos anos, desenvolvi uma habilidade para liderança de equipes e gestão de projetos. Gosto de trabalhar com pessoas e incentivar o desenvolvimento de suas habilidades individuais para que possam alcançar seus objetivos e contribuir para o sucesso do projeto como um todo.

                        Além disso, sou muito bom em análise de dados e estatísticas. Eu adoro trabalhar com números e transformá-los em insights que possam ajudar a tomar decisões estratégicas em projetos. Essa habilidade já me ajudou em diversas situações, tanto em projetos profissionais quanto em projetos pessoais.
                    """,
                    title: "Habilidades",
                    description: "Confira as habilidades compartilhadas"
                )
            ],
            feedbacks: []
        )
    ]
    
    @Published var nodes: [Node] = []
    
    init() {
        self.getPositions()
    }
    
    func updateBonds(imageList: [String]) {
        self.relationships = self.relationships.map { (relation) -> Profile in
            if imageList.contains(relation.image) {
                return Profile(name: relation.name,
                               image: relation.image,
                               force: min(relation.force + 1, 5),
                               status: relation.status,
                               cardList: relation.cardList,
                               feedbacks: relation.feedbacks)
            }
            return relation
        }
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
                force: relation.force,
                name: relation.name,
                image: relation.image,
                position: CGPoint(x: x, y: y)
            )
            nodes.append(node)
        }
        self.nodes = nodes
    }
}
