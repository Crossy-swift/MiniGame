//
//  SliderKit.swift
//  MiniGame
//
//  Created by Артем Репин on 12.06.2021.
//

import SwiftUI

struct SliderKit: UIViewRepresentable {
    
    @Binding var value: Double
    
    let score: Int
    
    private var alpha: CGFloat {
        CGFloat(score) / 150
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumTrackTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .allTouchEvents)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeValue(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

