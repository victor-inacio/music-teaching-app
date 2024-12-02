//
//  Lesson2.swift
//  music-sheet-app
//
//  Created by Victor Soares on 29/05/23.
//

import SwiftUI

struct Lesson2_Slide1: View {
    @State var show = false
    
    var body: some View {
        SlideView("A Clave de Sol é um dos símbolos utilizados na notação musical para indicar a altura das notas na pauta musical. Ela é representada por um desenho estilizado que se assemelha a uma letra \"G\" com uma linha atravessando-a. A Clave de Sol é comumente utilizada para representar as notas mais agudas na pauta.") {
            VStack {
                Spacer()
                Clef.g
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: show)
                Spacer()
            }
            
        }
        .onAppear {
            show = true
        }
    }
    
    
}

struct Lesson2_Slide2: View {
    @State var show = false
    
    var body: some View {
        SlideView(" Clave de Sol é colocada na segunda linha da pauta musical, contando de baixo para cima. Isso significa que a nota que é posicionada na segunda linha, onde a Clave de Sol está desenhada, é o \"Sol\" musical.") {
            VStack {
                Spacer()
                Image("sheet-g-clef")
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: show)
                Spacer()
            }
        }
        .onAppear {
            show = true
        }
    }
}


struct Lesson2_Slide3: View {
    @State var show = false
    var body: some View {
        SlideView("Para identificar as notas utilizando a Clave de Sol, é importante conhecer as linhas e os espaços que representam cada nota na pauta.") {
            VStack {
                Spacer()
                Image("sheet-g-clef-label")
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: show)
                Spacer()
            }
            .onAppear {
                show = true
            }
        }
    }
}


struct Lesson2_Slide4: View {
    var body: some View {
        QuestionView(question: .init(question: "Agora, vamos praticar! Identifique a nota na pauta abaixo:", possibleAnswers: [
            .init(text: "D"),
            .init(text: "C", isCorrect: true),
            .init(text: "F"),
            .init(text: "A"),
        ])) {
            VStack {
                Spacer()
                Image("sheet-g-clef-C-note")
                Spacer()
            }
        }
    }
}

struct Lesson2: View {
    var body: some View {
        Slideshow(views: [
            AnyView(Lesson2_Slide1()),
            AnyView(Lesson2_Slide2()),
            AnyView(Lesson2_Slide3()),
            AnyView(Lesson2_Slide4()),
        ])
    }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2_Slide4()
    }
}
