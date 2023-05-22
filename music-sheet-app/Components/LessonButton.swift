//
//  LessonButton.swift
//  music-sheet-app
//
//  Created by Victor Soares on 16/05/23.
//

import SwiftUI

struct LessonButton: View {
    
    var name: String
    var percentage: Int
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Circle()
                        .foregroundColor(Color("primary"))
                        .frame(width: 50, height: 50)
                    Text(name)
                        .foregroundColor(disabled ? Color("primary") : .white)
                }
                Spacer()
                ZStack {
                    Text(String(percentage) + "%")
                        .font(.system(size: 12))
                        .animation(.easeInOut(duration: 2), value: percentage)
                    Circle().stroke(.gray, lineWidth: 2)
                    Circle()
                        .rotation(Angle(degrees: -90))
                        .trim(from: 0, to: CGFloat(percentage) / 100)
                        .stroke(.green, lineWidth: 2)
                        .animation(.easeInOut(duration: 2), value: percentage)
                    
                }
                .frame(width: 38, height: 38)

            }
            .foregroundColor(.white)
            .padding(8)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color("primary-light"))
            .border(Color("primary"), width: 2)
            .cornerRadius(8)
            
            if (disabled) {
                VStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color.init(hex: "FFBF1B"))
                    Text("Termine a aula anterior para ter acesso a esta")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct LessonButton_Test: View {
    
    @State var percentage = 0
    
    var body: some View {
        LessonButton(name: "Introdução a Clave de G", percentage: percentage, disabled: true)
            .onAppear {
                percentage = 100
            }
    }
}

struct LessonButton_Previews: PreviewProvider {
    static var previews: some View {
        LessonButton_Test()
        
    }
}
