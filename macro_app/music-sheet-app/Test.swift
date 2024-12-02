//
//  Test.swift
//  music-sheet-app
//
//  Created by Victor Soares on 21/05/23.
//

import SwiftUI

struct Test: View {
    
    let views: [AnyView] = [
        AnyView(NavigationLink(destination: {
            Lesson1_Slide1()
        }, label: {
            Text("ASD")
        }))
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<views.count) { index in
                    views[index]
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Test()
        }
    }
}
