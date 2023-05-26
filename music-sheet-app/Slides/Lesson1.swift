//
//  Lesson1.swift
//  music-sheet-app
//
//  Created by Victor Soares on 16/05/23.
//

import SwiftUI

struct Lesson1_Slide1: View {
    

    
    var body: some View {
        SlideView("Para se ter um bom entendimento da partitura, é necessário antes saber um pouco sobre os elementos básicos da partitura, que serão apresentados nos slides seguintes.") {
            EmptyView()
        }
        
    }
    
}

struct Lesson1_Slide2: View {
    @State var show = false
    var body: some View {
        SlideView("A pauta\nA pauta é formada por 5 linhas e 4 espaços. Cada linha e cada espaço representa uma nota musical.") {
            MusicSheet()
                .opacity(show ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: show)
        }
        .onAppear {
            show = true
        }
    }
}

struct Lesson1_Slide3: View {
    @State var show = false
    var body: some View {
        SlideView("As claves.\nAs claves determinam quais vão ser as notas da pauta. Abaixo estão exemplos de como são posicionadas as claves na partitura e quais são as notas representadas na pauta.") {
            VStack {
                MusicSheet(clef: Clef.g)
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: show)
                Spacer()
                    .frame(height: 50)
                MusicSheet(clef: Clef.f)
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 1).delay(1), value: show)
            }
        }
        .onAppear {
            show = true
        }

    }
}

struct Lesson1_Slide4: View {
    @State var show = false
    var body: some View {
        SlideView("Duração das notas.\nCada nota é representada por um símbolo que indica por quanto tempo essa nota deve ser tocada.") {
            VStack {
                Image("duracao-notas")
                    .resizable()
                    .scaledToFit()
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: show)
            }
        }
        .onAppear {
            show = true
        }
    }
}

struct Lesson1_Slide5: View {
    @State var show = false
    var body: some View {
        SlideView("Pausas\nAs pausas indicam quando NÃO se deve tocar nenhuma nota.") {
            VStack {
                Image("duracao-pausas")
                    .resizable()
                    .scaledToFit()
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: show)
                    .frame(width: 400)
            }
            
            
        }
        .onAppear {
            show = true
        }
    }
}


struct Lesson1_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1_Slide5()
    }
}
