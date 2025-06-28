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

struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                          control: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ComicsGridView: View {
    @State private var selectedSection: UUID?
    @State private var navigateTo: ComicSection?
    
    let sections: [ComicSection] = [
        ComicSection(title: "Color", imageName: "color", destination: AnyView(ColorComicsView())),
        ComicSection(title: "Ultimate", imageName: "ultimate", destination: AnyView(Text("Vista Ultimate"))),
        ComicSection(title: "Legend", imageName: "legend", destination: AnyView(Text("Vista Legend"))),
        ComicSection(title: "Super", imageName: "super", destination: AnyView(Text("Vista Super"))),
        ComicSection(title: "Pel·lícules", imageName: "pelicules", destination: AnyView(Text("Vista Pel·lícules")))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                // Fondo con degradado suave
                LinearGradient(
                    colors: [Color.white, Color.blue.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(sections) { section in
                            Button(action: {
                                if selectedSection == section.id {
                                    navigateTo = section
                                } else {
                                    withAnimation {
                                        selectedSection = section.id
                                    }
                                }
                            }) {
                                ZStack(alignment: .bottom) {
                                    Image(section.imageName)
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .cornerRadius(14)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(Color.white, lineWidth: 1)
                                        )
                                        .shadow(radius: selectedSection == section.id ? 10 : 3)
                                    
                                    Text(section.title)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 12)
                                        .background(Color.black.opacity(0.6))
                                        .cornerRadius(10)
                                        .padding(6)
                                }
                                .scaleEffect(selectedSection == section.id ? 1.07 : 1.0)
                                .padding(4)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                }
                
                // Botón lateral curvado
                Button(action: {
                    print("Botón lateral pulsado")
                }) {
                    CurvedShape()
                        .fill(Color.green)
                        .frame(width: 80, height: 200)
                        .overlay(
                            CurvedShape().stroke(Color.black, lineWidth: 2)
                        )
                }
                .padding(.trailing, 0)
            }
            .navigationTitle("Bola de Drac: Còmics")
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(destination: navigateTo?.destination, isActive: Binding(
                    get: { navigateTo != nil },
                    set: { if !$0 { navigateTo = nil } }
                )) {
                    EmptyView()
                }
                    .hidden()
            )
        }
    }
    
}
