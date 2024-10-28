//
//  HandleView.swift
//  LampSwiftUI
//
//  Created by Natalia Sinitsyna on 28.10.2024.
//

import SwiftUI

struct HandleView: View {
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.white, lineWidth: 7)
                    .frame(width: 50, height: 70)
            }
            Rectangle()
                .frame(width: 7, height: 1000)
                .foregroundStyle(.white)
                .offset(y: -500)
            Text("ПОТЯНИ")
                .foregroundStyle(.white)
                .rotationEffect(Angle(degrees: -90))
                .font(.title)
                .opacity(0.3)
                .offset(x: -20, y: -150)
        }
    }
}


#Preview {
    HandleView()
}
