//
//  SlideView.swift
//  music-sheet-app
//
//  Created by Victor Soares on 17/05/23.
//

import SwiftUI

class SlideController: ObservableObject {
    public var canProceed = true
}

struct Slide1: View {
    @EnvironmentObject var slideController: SlideController
    @State var offset = 20
    @State var showFClef = true
    
    @State var text = ""
    
    var body: some View {
        SlideView(text) {
            VStack {
                Spacer()
                HStack(spacing: 30) {
                    VStack {
                        Clef.g
                        Text("Clave de Sol")
                    }
                    .offset(x: 0, y: CGFloat(offset))
                    .opacity(offset == 0 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: offset)
                    if showFClef {
                        VStack {
                            Clef.f
                            Text("Clave de Fá")
                        }
                        .id("afasd")
                        .offset(x: 0, y: CGFloat(offset))
                        .opacity(offset == 0 ? 1 : 0)
                        .animation( .easeInOut(duration: 0.5).delay(0.2), value: offset)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
        }
        .onAppear {
            text = "As claves de sol e de fá são importantes para um pianista ler a partitura"
            offset = 0
        }
    }
    
}

struct Slide2 : View {
    @EnvironmentObject var slideController: SlideController
    @State var offset = 0
    @State var showFClef = false
    
    @State var text = ""
    var body: some View {
        SlideView(text) {
            VStack {
                Spacer()
                HStack(spacing: 30) {
                    VStack {
                        Clef.g
                        Text("Clave de Sol")
                    }
                    .offset(x: 0, y: CGFloat(offset))
                    .opacity(offset == 0 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: offset)
                    if showFClef {
                        VStack {
                            Clef.f
                            Text("Clave de Fá")
                        }
                        .offset(x: 0, y: CGFloat(offset))
                        .opacity(offset == 0 ? 1 : 0)
                        .animation( .easeInOut(duration: 0.5).delay(0.2), value: offset)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Spacer()
            }
        }
        .onAppear {
            text = "Mas nesta lição vamos estudar apenas a clave de sol"
        }
    }
}

struct Slide3: View {
    @State private var lineDatas = [
        StaffLineData(widthScale: 0),
        StaffLineData(widthScale: 0, animationDelay: 0.5),
        StaffLineData(widthScale: 0, animationDelay: 1),
        StaffLineData(widthScale: 0, animationDelay: 1.5),
        StaffLineData(widthScale: 0, animationDelay: 2),
    ]
    
    var body: some View {
        SlideView("BlaBlaBla") {
            VStack {
                Spacer()
                MusicSheet(lineDatas: lineDatas)
                Spacer()
            }
        }
        .onAppear {
            for index in 0..<lineDatas.count {
                lineDatas[index].widthScale = 1
            }
        }
    }
}

struct Slide4: View {

    @State private var lineDatas = [
        StaffLineData(widthScale: 0),
        StaffLineData(widthScale: 0, animationDelay: 0.5),
        StaffLineData(widthScale: 0, animationDelay: 1),
        StaffLineData(widthScale: 0, animationDelay: 1.5),
        StaffLineData(widthScale: 0, animationDelay: 2),
    ]
    
    var body: some View {
        SlideView("Esta ") {
            VStack {
                Spacer()
                MusicSheet(lineDatas: lineDatas)
                Spacer()
            }
        }
        .onAppear {
            for index in 0..<lineDatas.count {
                lineDatas[index].widthScale = 1
            }
        }
    }
}

struct Slide5: View {

    @State private var lineDatas = [
        StaffLineData(widthScale: 0),
        StaffLineData(widthScale: 0, animationDelay: 0.5),
        StaffLineData(widthScale: 0, animationDelay: 1),
        StaffLineData(widthScale: 0, animationDelay: 1.5),
        StaffLineData(widthScale: 0, animationDelay: 2),
    ]
    
    var body: some View {
        SlideView("BlaBlaBla") {
            VStack {
                Spacer()
                MusicSheet(lineDatas: lineDatas)
                Spacer()
            }
        }
        .onAppear {
            for index in 0..<lineDatas.count {
                lineDatas[index].widthScale = 1
            }
        }
    }
}



struct SlideView<Content: View>: View {
    
    let text: String
    let content: () -> Content
    
    init(_ text: String, content: @escaping () -> Content) {
        self.text = text
        self.content = content
    }
    
    var body: some View {
        ZStack {
//            GeometryReader { geometry in
//                VStack(alignment: .center) {
//                    Text(text)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity)
//            }
            
            GeometryReader { geometry in
                VStack {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color("primary-light"))
                .border(Color("primary"), width: 3)
                .cornerRadius(3)
                .padding(.horizontal)
            }
            
            
            VStack {
                content()
            }
        }
    }
    
    
}

struct SlideView_Previews: PreviewProvider {
    let slideController = SlideController()
    static var previews: some View {
        
        Slide3()
    }
}
