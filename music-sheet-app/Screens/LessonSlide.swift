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
    }
}

//struct LessonSlidePreviewView: View {
//    
//    @State var isActive = false
//    
//    @State var lesson
//    
//    init(isActive: Bool = false, lesson: <#type#>) {
//        self.isActive = isActive
//        self.lesson = lesson
//    }
//    
//    var body: some View {
//        LessonSlide()
//            .environmentObject(lesson)
//            
//    }
//}
//
//struct LessonSlide_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonSlidePreviewView()
//    }
//}
