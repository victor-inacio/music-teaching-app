//
//  LessonButton.swift
//  music-sheet-app
//
//  Created by Victor Soares on 16/05/23.
//

import SwiftUI



struct LessonButton: View {
    
    @ObservedObject var lesson: Lesson
    var disabled: Bool = false
    var icon: Image?
    
    var body: some View {
        ZStack {
            HStack {
                HStack {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("primary"))
                            .frame(width: 50, height: 50)
                            .overlay {
                                if let icon = icon {
                                    icon
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                    }
                    .frame(minWidth: 50, maxWidth: 50)
                    Text(lesson.name)
                        .font(Font.custom("CrimsonPro-Regular", size: 20))
                        .foregroundColor(disabled ? Color("primary") : .white)
                }
                Spacer()
                ZStack {
                    Text(String(lesson.percentage) + "%")
                        .font(Font.custom("CrimsonPro-Regular", size: 12))
                        .animation(.easeInOut(duration: 2), value: lesson.percentage)
                    Circle().stroke(.gray, lineWidth: 2)
                    Circle()
                        .rotation(Angle(degrees: -90))
                        .trim(from: 0, to: CGFloat(lesson.percentage) / 100)
                        .stroke(.green, lineWidth: 2)
                        .animation(.easeInOut(duration: 2), value: lesson.percentage)
                    
                }
                .frame(width: 38, height: 38)
            }
            .foregroundColor(.white)
            .padding(8)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color("primary-light"))
            .border(Color("primary"), width: 2)
            .cornerRadius(8)
            .overlay {
                if disabled {
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .opacity(0.5)
                        
                        VStack {

                            
                            Image(systemName: "lock.fill")
                                .foregroundColor(Color.init(hex: "FFBF1B"))
                            Text("Termine a aula anterior para ter acesso a esta")
                                .font(Font.custom("CrimsonPro-Regular", size: 16))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    
   
}

struct LessonButton_Test: View {
    @StateObject var lesson = Lesson(name: "afasd", percentage: 0, link: AnyView(VStack {
        
    }), image: Image("g-clef"))
    var body: some View {
        LessonButton(lesson: lesson, disabled: true, icon: Image("g-clef"))
            .onAppear {
                lesson.percentage = 100
            }
    }
}

struct LessonButton_Previews: PreviewProvider {
    static var previews: some View {
        LessonButton_Test()
        
    }
}
