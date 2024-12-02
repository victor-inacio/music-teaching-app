//
//  Clef.swift
//  music-sheet-app
//
//  Created by Victor Soares on 17/05/23.
//

import SwiftUI



struct Clef: View, Identifiable, Equatable {
    let id = UUID()
    var baseLineIndex: Int
    var image: Image
    
    var body: some View {
        image
    }
    
    static let g = Clef(baseLineIndex: 6, image: Image("g-clef"))
    
    static let f = Clef(baseLineIndex: 2, image: Image("f-clef"))
    
    static func == (clef1: Clef, clef2: Clef) -> Bool {
        return clef1.baseLineIndex == clef2.baseLineIndex
    }
}

struct Clef_Previews: PreviewProvider {
    static var previews: some View {
        Clef.g
    }
}
