//
//  FinalView.swift
//  LampSwiftUI
//
//  Created by Natalia Sinitsyna on 28.10.2024.
//

import SwiftUI

struct FinalView: View {
    @State private var isLampOn = false
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var opacity: Double = 0.1
    
    var body: some View {
        ZStack {
            Color(UIColor(hex: "#04040FCC"))
            ZStack {
                if isLampOn {
                    LightShape()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.clear, Color.clear]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 300, height: 800)
                        .foregroundColor(Color.blue)
                        .offset(x: -55, y: 223)
                        .opacity(opacity)
                }
                Image("lamp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 600)
                    .offset(x: -70, y: -300)
                    .foregroundStyle(.white)
                    .foregroundColor(.white)
                if isLampOn {
                    VStack {
                        Spacer()
                            .frame(height: 600)
                        ZStack {
                            Text("\(String(format: "%.2f", opacity))")
                                .foregroundStyle(.white)
                                .font(.system(size: 80))
                                .opacity(opacity + 0.4)
                                .offset(y: -60)
                            Slider(value: $opacity, in: 0...0.3, step: 0.05)
                                .accentColor(.white)
                            Text("ЯРКОСТЬ")
                                .foregroundStyle(.white)
                                .font(.title)
                                .offset(y: 40)
                            
                        } .offset(x: -40)
                            .padding(80)
                    }
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(isLampOn ? .green : .red)
                        .frame(width: 250, height: 100)
                        .clipShape(
                            CustomShape(corner: [.bottomRight, .topLeft], radii: 100)
                        )
                        .opacity(0.1)
                    
                    Text(isLampOn ? "O N" : "O F F")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: -40)
                        .foregroundStyle(isLampOn ? .green : .red)
                }.offset(x: 170, y: 390)
            }
            HandleView()
                .offset(x: 140, y: isDragging ? dragOffset.height : -150)
                .animation(.spring(duration: 2, bounce: 0.3), value: isDragging)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isDragging = true
                            dragOffset = value.translation
                        }
                        .onEnded { value in
                            isDragging = false
                            dragOffset = .zero
                            if value.translation.height > 20 {
                                isLampOn.toggle()
                            }
                        }
                )
        }
    }
}

#Preview {
    FinalView()
}
