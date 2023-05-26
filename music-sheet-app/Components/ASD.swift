//
//  ASD.swift
//  music-sheet-app
//
//  Created by Victor Soares on 25/05/23.
//

import SwiftUI

struct ASD: View {
    
    @ObservedObject var lesson: Lesson
    
    
    var body: some View {
        Button("ad") {
            lesson.name = "asdadadadasd"
        }
    }
}

struct ASDPreviewView: View {
    @State var lesson = Lesson(name: "afasd", percentage: 0, link: AnyView(VStack {
        
    }), image: Image("g-clef"))
    var body: some View {
        ASD(lesson: lesson)
    }
}

struct ASD_Previews: PreviewProvider {
    static var previews: some View {
       ASDPreviewView()
    }
}
