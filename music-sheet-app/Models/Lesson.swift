//
//  Lesson.swift
//  music-sheet-app
//
//  Created by Victor Soares on 21/05/23.
//

import SwiftUI

struct Lesson: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let percentage: Int
    let link: AnyView
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let all: [Lesson] = [
        
        .init(name: "Elementos Básicos da Partitura", percentage: 0, link: AnyView(
            NavigationLink {
                NavigationLink {
                    NavigationLink {
                        NavigationLink {
                            NavigationLink {
                                
                            } label: {
                                Lesson1_Slide5()
                            }

                        } label: {
                            Lesson1_Slide4()
                        }

                    } label: {
                        Lesson1_Slide3()
                    }

                } label: {
                    Lesson1_Slide2()
                        .background(.white)
                }
                .buttonStyle(PlainButtonStyle())
            } label: {
                Lesson1_Slide1()
                    .background(.white)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(minHeight: 0, maxHeight: .infinity)
        ))
        
    ]
}

