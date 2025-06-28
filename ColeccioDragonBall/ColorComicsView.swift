//
//  ColorComicsView.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 23/6/25.
//

import SwiftUI
import SwiftUI

// MARK: - Modelo
struct Comic: Identifiable {
    let id: Int
    let title: String
    let imageName: String
    var owned: Bool
}

struct Saga {
    let name: String
    let color: Color
    var comics: [Comic]

    var progressText: String {
        let owned = comics.filter { $0.owned }.count
        return "\(owned) / \(comics.count)"
    }
}

// MARK: - Vista principal
struct ColorComicsView: View {
    @Environment(\.openURL) var openURL
    @State private var sagas: [Saga] = [
        Saga(name: "Saga Origen", color: .sagaOrigen,
             comics: (1...8).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: i <= 6) }),
        Saga(name: "Saga Cor Petit", color: .sagacorpetit,
             comics: (9...12).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Guerrers de l'espai", color: .sagaGuerrersIcelula,
             comics: (13...15).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Freezer", color: .sagaFreezer,
             comics: (16...21).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Cèl·lula", color: .sagaGuerrersIcelula,
             comics: (22...27).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Boo", color: .sagaBu,
             comics: (28...32).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
    ]
    
    var body: some View {
        List {
            ForEach(sagas.indices, id: \.self) { sIndex in
                Section(
                    header:
                        Text("\(sagas[sIndex].name) – \(sagas[sIndex].progressText)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(sagas[sIndex].color)
                        .cornerRadius(8)
                ) {
                    ForEach($sagas[sIndex].comics) { $comic in
                        HStack(alignment: .center, spacing: 16) {
                            Image(comic.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 90)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(comic.title)
                                    .font(.headline)
                                Text(comic.owned ? "✅ El tens" : "❌ Et falta")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Button(action: {
                                    let query = "Comprar \(comic.title) Bola de Drac"
                                    if let url = URL(string: "https://www.google.com/search?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                                        openURL(url)
                                    }
                                }) {
                                    Label("Buscar", systemImage: "magnifyingglass")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                            
                            Spacer()
                            
                            Toggle("", isOn: $comic.owned)
                                .labelsHidden()
                                .tint(sagas[sIndex].color) // usa el color de la saga
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                    }
                }
            }
        }
    }
}
