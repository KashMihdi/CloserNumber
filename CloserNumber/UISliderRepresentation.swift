//
//  UISliderView.swift
//  CloserNumber
//
//  Created by Kasharin Mikhail on 19.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    let opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChange),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: opacity
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

// MARK: - Coordinator
extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double

        init(value: Binding<Double>) {
            self._value = value
        }

        @objc func valueDidChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}



