//
//  Lesson.swift
//  music-sheet-app
//
//  Created by Victor Soares on 21/05/23.
//

import SwiftUI

class LessonsViewModel: ObservableObject, Identifiable {
    let id: UUID = UUID()
    
    @Published var allLessons: [Lesson]
    
    init(allLessons: [Lesson]) {
        self.allLessons = allLessons
    }
}

class Lesson: Hashable, Identifiable, ObservableObject {
    let id: UUID = UUID()
    @Published var name: String
    @Published var percentage: Int
    let link: AnyView
    let image: Image?
    
    init(name: String, percentage: Int, link: AnyView, image: Image?) {
        self.name = name
        self.percentage = percentage
        self.link = link
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        return lhs.id == rhs.id
    }
    
    func changePercentage(_ percentage: Int) -> Void {
        self.percentage = percentage
    }
}

