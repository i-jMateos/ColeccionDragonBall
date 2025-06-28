import SwiftUI

struct ComicDetailView: View {
    let comic: ComicVolume

    var body: some View {
        VStack(spacing: 16) {
            Image(comic.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .shadow(radius: 5)

            Text(comic.title)
                .font(.title)
                .bold()

            Spacer()
        }
        .padding()
        .navigationTitle("Detall")
    }
}
