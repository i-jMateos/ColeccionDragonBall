import SwiftUI

struct ColorComicsView: View {
    let volumes: [ComicVolume] = (1...32).map { i in
        ComicVolume(id: i, title: "Volum \(i)", imageName: "\(i)")
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(volumes) { volume in
                        NavigationLink(destination: ComicDetailView(comic: volume)) {
                            VStack {
                                Image(volume.imageName)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)

                                Text(volume.title)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Bola de Drac Color")
            .background(Color.white)
        }
    }
}
