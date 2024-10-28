//
//  LightShape.swift
//  LampSwiftUI
//
//  Created by Natalia Sinitsyna on 28.10.2024.
//

import SwiftUI

struct LightShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addLines([
            .init(x: rect.width * 0.1, y: 0),
            .init(x: rect.width * 0.8, y: 0),
            .init(x: rect.width, y: rect.height * 1.1),
            .init(x: 0, y: rect.height * 0.9)
        ])
        return path
    }
}
