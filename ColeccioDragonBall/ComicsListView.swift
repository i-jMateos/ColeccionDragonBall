//
//  ComicsGridView.swift.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 21/6/25.
//

import SwiftUI

struct ComicSection: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let destination: AnyView
}

struct ComicsListView: View {
    let sections: [ComicSection] = [
        ComicSection(title: "Color", imageName: "color", destination: AnyView(ColorComicsView())),
        ComicSection(title: "Ultimate", imageName: "ultimate0", destination: AnyView(UltimateComicsView())),


        ComicSection(title: "Legend", imageName: "legend", destination: AnyView(Text("Vista Legend"))),
        ComicSection(title: "Super", imageName: "super", destination: AnyView(Text("Vista Super"))),
        ComicSection(title: "Pel·lícules", imageName: "peliculas", destination: AnyView(Text("Vista Pel·lícules")))
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(sections) { section in
                    NavigationLink(destination: section.destination) {
                        HStack(spacing: 16) {
                            Image(section.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 90)
                                .clipped()
                                .cornerRadius(8)

                            Text(section.title)
                                .font(.headline)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Bola de Drac: Còmics")
        }
    }
}
