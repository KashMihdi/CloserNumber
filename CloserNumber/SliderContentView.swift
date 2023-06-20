//
//  SliderView.swift
//  CloserNumber
//
//  Created by Kasharin Mikhail on 19.06.2023.
//

import SwiftUI

struct SliderContentView: View {
    @StateObject private var setting =  SliderGameSettings()
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 26) {
            Text("Move slider as close as possible to \(setting.gameValue)")

            HStack(spacing: 16) {
                Text("0").font(.title3)
                
                UISliderRepresentation(
                    value: $setting.userValue,
                    opacity: setting.opacity
                )
                
                Text("100").font(.title3)
            }
            .padding(.horizontal, 10)
            
            Button("Check result") { isPresented.toggle() }
                .alert("Excellent", isPresented: $isPresented, actions: {}) {
                    Text("Your score: \(setting.computerScore())")
                }
        
            Button("Start over", action: setting.reset)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderContentView()
    }
}
