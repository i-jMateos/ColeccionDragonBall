//
//  MainView.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 18/6/25.
//
import SwiftUI



//struct MainView: View {
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 40) {
//                Text("Col·lecció Bola de Drac")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top)
//
//                NavigationLink(destination: ComicsView()) {
//                    SectionCard(title: "📚 Còmics", color: .orange)
//                }
//
//                NavigationLink(destination: FiguresView()) {
//                    SectionCard(title: "🧸 Figures", color: .purple)
//                }
//
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)

                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    Text("La meva col·lecció Dragon Ball")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)

                    NavigationLink(destination: ComicsView()) {
                        SectionCard(title: "Còmics", imageName: "book.closed")
                    }


                    NavigationLink(destination: FiguresView()) {
                        SectionCard(title: "Figures", imageName: "cube.box.fill")
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
