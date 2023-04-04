//
//  LisBella.swift
//  Foundations
//
//  Created by José Danilo Silva do Carmo on 28/03/23.
//

import SwiftUI

extension PresentationDetent {
    static let bar = Self.custom(BarDetent.self)
    static let small = Self.height(100)
    static let extraLarge = Self.fraction(0.75)
}

private struct BarDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        max(44, context.maxDetentValue * 0.1)
    }
}

struct SheetView: View {
    @Binding var showView: Bool

    var body: some View {
        Button("Press to dismiss") {
            withAnimation { showView.toggle() }
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct LisBella: View {
    @State private var showSettings = false
    @State private var selectedDetent = PresentationDetent.bar

    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SheetView(showView: $showSettings)
                .presentationDetents(
                    [.bar, .small, .medium, .large, .extraLarge],
                    selection: $selectedDetent)
        }
    }
}

struct LisBella_Previews: PreviewProvider {
    static var previews: some View {
        LisBella()
    }
}
