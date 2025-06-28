//
//  Untitled.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 18/6/25.
//
import SwiftUI

struct SectionCard: View {
    var title: String
    var imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName )
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding()
                .foregroundColor(.white)

            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                   startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}


