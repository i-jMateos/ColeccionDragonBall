//
//  ColorComicsView.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 23/6/25.
//

import SwiftUI

struct ColorComicsView: View {
    @Namespace private var imageNamespace
    @State private var selectedComic: Comic? = nil
    @State private var isDetailShown: Bool = false
    @Environment(\.openURL) var openURL

    @State private var sagas: [Saga] = [
        Saga(name: "Saga Origen", color: .sagaOrigen,
             comics: (1...8).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: i <= 6) }),
        Saga(name: "Saga Cor Petit", color: .sagacorpetit,
             comics: (9...12).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Guerrers de l'espai", color: .sagaguerrersIcelula,
             comics: (13...15).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Freezer", color: .sagaFreezer,
             comics: (16...21).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Cèl·lula", color: .sagaguerrersIcelula,
             comics: (22...27).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) }),
        Saga(name: "Boo", color: .sagaBu,
             comics: (28...32).map { i in Comic(id: i, title: "Volum \(i)", imageName: "\(i)", owned: false) })
    ]

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 24, pinnedViews: [.sectionHeaders]) {
                    ForEach(sagas.indices, id: \.self) { sIndex in
                        Section {
                            ForEach($sagas[sIndex].comics) { $comic in
                                HStack(spacing: 16) {
                                    Image(comic.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .matchedGeometryEffect(id: comic.id, in: imageNamespace)
                                        .frame(width: comic.owned ? 60 : 50, height: comic.owned ? 90 : 75)
                                        .grayscale(comic.owned ? 0 : 1)
                                        .opacity(comic.owned ? 1.0 : 0.4)
                                        .cornerRadius(10)
                                        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                                selectedComic = comic
                                                isDetailShown = true
                                            }
                                        }

                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(comic.title).font(.headline)
                                        Text(comic.owned ? "✅ El tens" : "❌ Et falta")
                                            .font(.subheadline)
                                    }

                                    Spacer()

                                    Toggle("", isOn: $comic.owned)
                                        .labelsHidden()
                                        .tint(sagas[sIndex].color)
                                }
                                .padding()
                                .background(sagas[sIndex].color.opacity(comic.owned ? 0.3 : 0.1))
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
                            }
                        } header: {
                            HStack {
                                Text(sagas[sIndex].name)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                Text(sagas[sIndex].progressText)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.85))
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(sagas[sIndex].color)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .blur(radius: isDetailShown ? 8 : 0)

            if let comic = selectedComic, isDetailShown {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture { closeDetail() }

                    VStack(spacing: 20) {
                        Image(comic.imageName)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: comic.id, in: imageNamespace)
                            .frame(maxHeight: 350)
                            .cornerRadius(16)
                            .shadow(radius: 20)

                        Text(comic.title)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)

                        Button(action: {
                            let query = "Comprar \(comic.title) Bola de Drac"
                            if let url = URL(string: "https://www.google.com/search?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                                openURL(url)
                            }
                        }) {
                            Label("Buscar per comprar", systemImage: "cart")
                                .font(.headline)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                        }

                        Button("Tancar") {
                            closeDetail()
                        }
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.top, 10)
                    }
                    .padding()
                    .transition(.opacity)
                }
            }
        }
        .navigationTitle("Color")
    }

    private func closeDetail() {
        withAnimation(.spring()) {
            isDetailShown = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                selectedComic = nil
            }
        }
    }
}
