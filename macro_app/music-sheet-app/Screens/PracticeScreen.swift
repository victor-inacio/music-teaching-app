//
//  PracticeScreen.swift
//  music-sheet-app
//
//  Created by Victor Soares on 03/06/23.
//

import SwiftUI

let musicNotes = ["C", "D", "E", "F", "F", "F", "C", "D", "C", "D", "D", "D", "C", "G", "F", "E", "E", "E", "C", "D", "E", "F", "F", "F"]


struct PracticeScreen: View {
    
    @State var rightNotes: [String] = []
    @Binding var easterEgg: Bool
    
    var body: some View {
        VStack {
    
            Spacer()
            MusicSheet(clef: Clef.g)
            Spacer()
            Keys { note in
                
                if playedMusicRight(lastNote: note) {
                 
                   easterEgg = true
                    
                }
                
            }
            
        }
    }
    
    func playedMusicRight(lastNote: Note) -> Bool {
        
        let noteLength = Int(rightNotes.count)
        
        if musicNotes[noteLength] != lastNote.name {
            rightNotes = []
            print("Errou!")
        } else {
            rightNotes.append(lastNote.name)
            print(lastNote.name)
        }
        
        if musicNotes.count == rightNotes.count {
            
            print("CONSEGUIU!")
            
            rightNotes = []
            return true
        }
        
        return false
    }
}

struct EasterEggPreviewView: View {
    
    @State var easterEgg = false
    var body: some View {
        PracticeScreen(easterEgg: $easterEgg)
        
        
    }
}

struct PracticeScreen_Previews: PreviewProvider {
    static var previews: some View {
        EasterEggPreviewView()
    }
}
