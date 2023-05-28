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
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
				Spacer()
					.frame(height: 100)
				HStack {
					NavigationLink(destination: TheoryScreen()) {
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
