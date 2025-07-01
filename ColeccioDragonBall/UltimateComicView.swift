//
//  UtimateComicView.swift
//  ColeccioDragonBall
//
//  Created by Jordi on 29/6/25.
//

/*import SwiftUI

struct UltimateComicsView: View {
    let ultimateComics: [Comic] = (1...34).map {
        Comic(id: $0, title: "Volum \($0)", imageName: "ultimate\($0)", owned: false)
    }




    @Namespace private var imageNamespace
    @State private var selectedComic: Comic?
    @State private var isDetailShown = false

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 16)], spacing: 16) {
                ForEach(ultimateComics) { comic in
                    VStack(spacing: 4) {
                        Text(comic.imageName)
                            .font(.caption2)
                            .foregroundColor(.gray)

                        Image(comic.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 140)
                            .background(Color.gray.opacity(0.2)) // para confirmar espacio
                            .cornerRadius(8)
                            .saturation(comic.owned ? 1 : 0)
                            .onTapGesture {
                                selectedComic = comic
                                isDetailShown = true
                            }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isDetailShown) {
            if let comic = selectedComic {
                ComicDetailView(comic: comic)
            }
        }
        .navigationTitle("Ultimate")
        .onAppear {
            print("👀 UltimateComicsView se está mostrando con \(ultimateComics.count) cómics")
        }
    }
}
*/
 // UltimateComicsView.swift (actualizado con doble toque y tens)
import SwiftUI

struct UltimateComicsView: View {
    @State private var ultimateComics: [Comic] = (1...34).map {
        Comic(id: $0, title: "Volum \($0)", imageName: "ultimate\($0)", owned: false)
    }

    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)

        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach($ultimateComics) { $comic in
                    VStack(spacing: 6) {
                        Image(comic.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .grayscale(comic.owned ? 0 : 1)
                            .opacity(comic.owned ? 1.0 : 0.4)
                            .scaleEffect(comic.owned ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 0.25), value: comic.owned)
                            .frame(height: 100)
                            .onTapGesture {
                                comic.owned.toggle()
                            }

                        Text(comic.title)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle("Ultimate")
    }
}
