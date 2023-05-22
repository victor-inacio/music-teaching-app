//
//  TheoryScreen.swift
//  music-sheet-app
//
//  Created by Victor Soares on 16/05/23.
//

import SwiftUI
// TODO: Fazer um loop com navigation links
struct TheoryScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Lesson.all, id: \.id) { lesson in
                    NavigationLink {
                        lesson.link
                    } label: {
                        LessonButton(name: lesson.name, percentage: lesson.percentage)
                    }

                }
            }
        }
        .padding(.horizontal, 10)
    }
}

struct TheoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TheoryScreen()
        }
    }
}
