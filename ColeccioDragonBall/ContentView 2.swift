//
//  ContentView.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 18/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                NavigationLink(destination: ComicsListView()) {
                    SectionCard(title: "Còmics", imageName: "books.vertical")
                }

                NavigationLink(destination: FiguresView()) {
                    SectionCard(title: "Figures", imageName: "figure.stand")
                }
            }
            .padding()
            .navigationTitle("Col·lecció Dragon Ball")
        }
    }
}

#Preview {
    ContentView()
}

