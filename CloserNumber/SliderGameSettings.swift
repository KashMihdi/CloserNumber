//
//  SliderLogic.swift
//  CloserNumber
//
//  Created by Kasharin Mikhail on 19.06.2023.
//

import Foundation

final class SliderGameSettings: ObservableObject {
    @Published var userValue = 0.0
    var gameValue = Int.random(in: 1...100)
    
    var opacity: Double {
        Double(computerScore()) / 100
    }
    
    func computerScore() -> Int {
        let difference = abs(gameValue - lround(userValue))
        return 100 - difference
    }
    
    func reset() {
        userValue = 0
        gameValue = Int.random(in: 1...100)
    }
}
