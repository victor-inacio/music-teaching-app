//
//  Keys.swift
//  music-sheet-app
//
//  Created by Victor Soares on 30/05/23.
//

import SwiftUI
import AVFoundation

struct WhiteKey: View {
    var body: some View {
        Rectangle()
        .border(.black, width: 2)
        .padding(0)
        .frame(width: 48, height: 209)
        .foregroundColor(.white)
    }
}

struct BlackKey: View {
    var body: some View {
        Rectangle()
       
        .padding(0)
        .frame(width: 32, height: 113)
        .foregroundColor(.black)
    }
    
}

var player = AVAudioPlayer()

struct Keys: View {
    
    var naturals = Note.naturals
    var onKeyTap: (_ note: Note) -> Void
    
    var body: some View {
        ZStack {
            
            HStack(spacing: 0) {
                ForEach(Array(naturals.enumerated()), id: \.element.frequency) { (index, key) in
                    
                    ZStack(alignment: .leading) {
                        
                        Button {
                            onKeyTap(key)
                            playNoteWithName(noteName: key.name)
                        } label: {
                            WhiteKey()
                                .padding(0)
                        }
                        
                        if key.hasSustain {
                            HStack {
                                Button {
                                    onKeyTap(key.getSustainedCopy())
                                    playNoteWithName(noteName: key.getSustainedCopy().name)
                                } label: {
                                    BlackKey()
                                }
                                .padding(0)
                                .position(x: 48)
                                .frame(maxWidth: 32, maxHeight: 113)
                                .zIndex(50)
                                .padding(0)
                            }
                            Spacer()
                        }
                        
                        
                    }
                    .zIndex(Double(index * -10))
                }
            }
        }
        .border(.black, width: 2)
        .cornerRadius(5)
        .frame(height: 209)
        }

    func playNoteWithName(noteName: String) {

        let audioSession = AVAudioSession.sharedInstance()
         do {
             try audioSession.setCategory(.playback)
             try audioSession.setActive(true)
         } catch {
             print("Setting category to AVAudioSessionCategoryPlayback failed.")
         }
        
        guard let soundFileURL = Bundle.main.url(forResource: noteName, withExtension: "mp3") else {
            print("Arquivo de som não encontrado.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundFileURL)
           player.prepareToPlay()
            player.play()
        } catch {
            print("Erro ao reproduzir o som: \(error.localizedDescription)")
        }
    }

    // Exemplo de uso para reproduzir a nota C
   

        
    }


struct Keys_Previews: PreviewProvider {
    static var previews: some View {
        Keys { note in
            
        }
    }
}
