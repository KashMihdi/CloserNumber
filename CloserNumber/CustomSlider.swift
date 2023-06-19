//
//  CustomSlider.swift
//  CloserNumber
//
//  Created by Kasharin Mikhail on 19.06.2023.


// НЕ ДЛЯ ПРОВЕРКИ!

import SwiftUI
struct CustomSlider: View {
    @Binding var value: Double
    var opacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.red.opacity(0.3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .frame(height: 6)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .frame(width: value * geometry.size.width, height: 6)
                
                Circle()
                    .fill(.white)
                    .frame(width: 26)
                    .overlay(
                        Circle()
                            .fill(Color.red.opacity(opacity))
                    )
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .shadow(color: .black.opacity(0.4), radius: 6, x: 0, y: 4)
                    .offset(x: value * geometry.size.width - 15)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                updateValue(with: value, in: geometry)
                            })
                    )
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 40)
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        value = min(max(newValue, 0), 1)
    }
}

