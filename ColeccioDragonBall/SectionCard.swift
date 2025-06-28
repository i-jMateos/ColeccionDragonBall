//
//  Untitled.swift
//  ColeccionDragonBall
//
//  Created by Jordi on 18/6/25.
//
import SwiftUI

import SwiftUI

struct SectionCard: View {
    var title: String
    var imageName: String
    var subtitle: String? = nil

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding()
                .foregroundColor(.white)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
            }

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    VStack(spacing: 20) {
        SectionCard(title: "Color", imageName: "book.closed", subtitle: "28 / 32")
        SectionCard(title: "Ultimate", imageName: "book.closed")
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
