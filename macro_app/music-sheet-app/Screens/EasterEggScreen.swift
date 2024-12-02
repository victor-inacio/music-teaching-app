//
//  EasterEggScreen.swift
//  music-sheet-app
//
//  Created by Victor Soares on 04/06/23.
//

import SwiftUI

struct EasterEggScreen: View {
    var body: some View {
        VStack {
            
            Text("Academigos <3")
                .font(.title)
            
            Image("Academigos")
                .resizable()
                .scaledToFit()
            
        }
    }
}



struct EasterEggScreen_Previews: PreviewProvider {
    static var previews: some View {
        EasterEggScreen()
    }
}
