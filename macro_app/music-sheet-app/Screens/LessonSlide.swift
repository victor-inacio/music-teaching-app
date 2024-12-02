//
//  LessonSlide.swift
//  music-sheet-app
//
//  Created by Victor Soares on 24/05/23.
//

import SwiftUI

struct LessonSlide: View {
    @ObservedObject var lesson: Lesson
    
    var body: some View {
        lesson.link
            .environmentObject(lesson)
            .navigationTitle(lesson.name)
    }
}

struct LessonSlidePreviewView: View {
    @State var lesson = Lesson(name: "Elementos Básicos da Partitura", percentage: 0, link: AnyView(
        Slideshow(views: [
                   AnyView(Lesson1_Slide1()),
                   AnyView(Lesson1_Slide2()),
                   AnyView(Lesson1_Slide3()),
                   AnyView(Lesson1_Slide4()),
                   AnyView(Lesson1_Slide5()),
                   AnyView(QuestionView(question: Question(question: "Quais são as duas claves mais importantes para um pianista ler a partitura?", possibleAnswers: [
                    .init(text: "C e F"),
                    .init(text: "G e B"),
                    .init(text: "A e E"),
                    .init(text: "G e F", isCorrect: true),
                ])) {
                    VStack {
                        VStack {
                            Spacer()
                            HStack(spacing: 30) {
                                VStack {
                                    Clef.g
                                }
                                VStack {
                                    Clef.f
                                }

                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            Spacer()
                        }
                    }
                })
               ])
    ), image: Image("g-clef"))
    
    var body: some View {
        LessonSlide(lesson: lesson)
            .environmentObject(lesson)
            
    }
}

struct LessonSlide_Previews: PreviewProvider {
    static var previews: some View {
        LessonSlidePreviewView()
    }
}
