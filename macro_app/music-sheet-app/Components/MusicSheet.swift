//
//  MusicSheet.swift
//  music-sheet-app
//
//  Created by Victor Soares on 16/05/23.
//

import SwiftUI

struct NoteLabel: View {
    
    let index: Int
    let clef: Clef
    private var notes: [String] = []
    let space: Bool
    
    init(index: Int, clef: Clef, space: Bool = false) {
        self.index = index
        self.clef = clef
        self.space = space
        
        switch(clef) {
            case .g:
                self.notes = ["F", "E","D","C","B","A","G","F","E"]
            case .f:
                self.notes = ["A", "G", "F", "E", "D", "C", "B", "A", "G"]
        default:
            break
        }
    }
    var body: some View {
        let actualIndex = space ? (index * 2) + 1 : index * 2
        if notes.indices.contains(actualIndex) {
            Text(notes[actualIndex])
            .font(.system(size: 20))
            .padding(3)
            .foregroundColor(.white)
            .background(Color("primary"))
            .cornerRadius(3)
        }
    }
}

struct MusicSheet: View {
    let lineThickness: CGFloat = 3
    let totalLineSpacing: CGFloat = 22
    let lineSpacingWithoutLines: CGFloat
    let noteWidth: CGFloat = 30
    
    var lineDatas: [StaffLineData] = []
    
    var clef: Clef?
    
    init(clef: Clef? = nil, lineDatas: [StaffLineData]? = nil) {
        self.lineSpacingWithoutLines = totalLineSpacing - totalLineSpacing * 2
        
        if (clef != nil) {
            self.clef = clef
        }
        
        if (lineDatas == nil) {
            for _ in 0..<5 {
                let line = StaffLineData()
                
                self.lineDatas.append(line)
            }
        } else {
            self.lineDatas = lineDatas!
        }
        
    }
    
    var body: some View {
        ZStack {
            // Lines
            VStack() {
                ForEach(0..<5) { index in
                    GeometryReader { geometry in
                        ZStack {
                            Rectangle()
                                .padding(0)
                                .frame(width: geometry.size.width * CGFloat(lineDatas[index].widthScale), height: lineThickness)
                                .foregroundColor(lineDatas[index].color)
                            
                            if clef != nil {
                                HStack {
                                    Spacer()
                                        .frame(width: 100)
//                                    NoteLabel(index: index * 2, clef: clef!)
                                }
                            }
                        }
                        .frame(height: lineThickness)
                    }
                    .frame(height: 3)
                    if (index != 4) {
                        Spacer()
                            .frame(height: 0)
                        ZStack {
                            
//                            if let clef = clef && index < 3 {
//                                NoteLabel(index: index, clef: clef)
//                            }
                            
                                
                        }
                        .frame(minHeight: totalLineSpacing - lineThickness, maxHeight: totalLineSpacing - lineThickness)
                        Spacer()
                            .frame(height: 0)
                    }
                }
            }
            
            //
            HStack {
         
                
                HStack {
                    // Clef
                    if ((clef) != nil) {
                        clef
                    }
                }
                .frame(width: 100)
                // Notes container
                HStack {
                    // Note image
//                    Image("whole_note")
//                        .offset(x: noteWidth / 2, y: 1)
//                        .position(x: 0, y: -lineSpacingWithoutLines / 2 * 0)
                    
                    // Spacer to reserve space
                    // to the notes container
                    Spacer()
                }
                .frame(height: 91)
            }
        }
        .onAppear {
        }
    }
}

struct StaffLineData {
    var widthScale: Float = 1
    var animationDelay: Float = 0
    var color: Color = .black
}

struct StaffLine: Shape {
    let lineThickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.minX, y: rect.midY - (lineThickness / 2))
        let endPoint = CGPoint(x: rect.maxX, y: rect.midY - (lineThickness / 2))
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}

struct MusicSheet_Previews_View: View {
    
    @State private var lineDatas = [
        StaffLineData(widthScale: 0),
        StaffLineData(widthScale: 0, animationDelay: 0.5),
        StaffLineData(widthScale: 0, animationDelay: 1),
        StaffLineData(widthScale: 0, animationDelay: 1.5),
        StaffLineData(widthScale: 0, animationDelay: 2),
    ]
    
    var body : some View {
        ScrollView {
            VStack {
                MusicSheet(clef: Clef.g, lineDatas: lineDatas)
                MusicSheet(clef: Clef.f)
            }
        }
        .onAppear {
            withAnimation {
                for index in 0..<lineDatas.count {
                    lineDatas[index].widthScale = 1
                }
            }
        }
    }
}


struct MusicSheet_Previews: PreviewProvider {
    static var previews: some View {
        
        
        MusicSheet_Previews_View()
        
    }
}
