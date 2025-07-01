//
//  Models.swift
//  ColeccioDragonBall
//
//  Created by Jordi on 29/6/25.
//

import SwiftUI

// MARK: - Modelos

struct Comic: Identifiable, Equatable {
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

func generateComics() -> [Comic] {
    (1...34).map {
        Comic(id: $0, title: "Volum \($0)", imageName: "ultimate\($0)", owned: false)
    }
}
