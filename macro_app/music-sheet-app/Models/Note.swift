//
//  Note.swift
//  music-sheet-app
//
//  Created by Victor Soares on 30/05/23.
//

import SwiftUI

struct Note {
    
    private var _name: String
    var frequency: Float
    var hasSustain: Bool
    var isSustained: Bool
    
    var name: String {
        set {
            self._name = newValue
        }
        
        get {
            return self.isSustained ? self._name + "#" : self._name
        }
    }
    
    init(name: String, frequency: Float, hasSustain: Bool, isSustained: Bool) {
        self._name = name
        self.frequency = frequency
        self.hasSustain = hasSustain
        self.isSustained = isSustained
    }
    
    func getSustainedCopy() -> Note {
            var copy = self
            copy.isSustained = true
            
            // Ajustar a frequência para obter o sustenido
            let semitoneRatio: Float = 1.0594631
            copy.frequency *= semitoneRatio
            
            return copy
        }
    
    
    static var naturals: [Note] = [
        Note(name: "C", frequency: 261.63, hasSustain: true, isSustained: false),
        Note(name: "D", frequency: 293.66, hasSustain: true, isSustained: false),
        Note(name: "E", frequency: 329.63, hasSustain: false, isSustained: false),
        Note(name: "F", frequency: 349.23, hasSustain: true, isSustained: false),
        Note(name: "G", frequency: 392.00, hasSustain: true, isSustained: false),
        Note(name: "A", frequency: 440.00, hasSustain: true, isSustained: false),
        Note(name: "B", frequency: 493.88, hasSustain: false, isSustained: false)
    ]

    
}

