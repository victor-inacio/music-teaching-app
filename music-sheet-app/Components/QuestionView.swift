//
//  QuestionView.swift
//  music-sheet-app
//
//  Created by Victor Soares on 23/05/23.
//

import SwiftUI

struct Answer {
    let id: UUID = UUID()
    let text: String
    var isCorrect = false
    var disabled: Bool = false
    
    init(text: String, isCorrect: Bool = false, disabled: Bool = false) {
        self.text = text
        self.isCorrect = isCorrect
        self.disabled = disabled
    }
}

struct Question {
    let question: String
    var possibleAnswers: [Answer]
}

struct QuestionView<Content: View>: View {
    
    @State var question: Question
    @State var showModal = false
    @EnvironmentObject var lesson: Lesson
    @Environment(\.dismiss) private var dismiss
    
    var onSuccess: (() -> Void)?
    
    let content: () -> Content
    
    var body: some View {
        SlideView(question.question) {
            VStack {
                content()
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ]) {
                    ForEach(0..<question.possibleAnswers.count) { index in
                        Button {
                            if question.possibleAnswers[index].isCorrect {
                                showModal = true
                            } else {
                                question.possibleAnswers[index].disabled = true
                            }
                        } label: {
                            QuadButton(text: question.possibleAnswers[index].text, Icon: nil, disabled: question.possibleAnswers[index].disabled)
                        }
                        .disabled(question.possibleAnswers[index].disabled)
                    }
                }
            }
        }
        .alert("Você acertou!",isPresented: $showModal) {
            Button {
                if let onSuccess = onSuccess {
                    onSuccess()
                }
                lesson.percentage = 100
                dismiss()
            } label: {
                Text("Ok")
            }

        }
    }
}

struct QuestionViewPreview: View {
    
    var body: some View {
        QuestionView(question: Question(question: "Testeaedewfewf ?", possibleAnswers: [
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
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewPreview()
    }
}
