//
//  ContentView.swift
//  music-sheet-app
//
//  Created by Victor Soares on 15/05/23.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Logo kkk dps eu faço")
                        .foregroundColor(.white)
                }
                .frame(width: 185, height: 185)
                .background(.gray)
                .clipShape(Circle())
                
                Spacer()
                    .frame(height: 100)
                
                HStack {
                    NavigationLink {
                        TheoryScreen()
                    } label: {
                        QuadButton(text: "Teoria", Icon: Image(systemName: "pencil.and.outline"))
                    }

                    Spacer()
                        .frame(width: 40)
                    NavigationLink {
                        
                    } label: {
                        QuadButton(text: "Prática", Icon: Image(systemName: "music.note.list"))
                    }

                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
