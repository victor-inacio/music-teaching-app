//
//  ContentView.swift
//  music-sheet-app
//
//  Created by Victor Soares on 15/05/23.
//

import SwiftUI

struct MainScreen: View {
	@State var easterEgg = false
	
	var body: some View {
		NavigationStack {
			VStack {
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
				Spacer()
					.frame(height: 100)
				VStack {
					HStack {
						NavigationLink(destination: TheoryScreen()) {
							QuadButton(text: "Teoria", Icon: Image(systemName: "pencil.and.outline"))
						}
						Spacer()
							.frame(width: 40)
						NavigationLink {
							PracticeScreen(easterEgg: $easterEgg)
						} label: {
							QuadButton(text: "Prática", Icon: Image(systemName: "music.note.list"))
						}
				
						
					}
					
					Spacer()
						.frame(height: 30)
					
					if easterEgg {
						HStack {
							Spacer()
							NavigationLink(destination: EasterEggScreen()) {
								QuadButton(text: "Academigos <3", Icon: Image(systemName: "heart.fill"))
							}
							Spacer()
						}
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
