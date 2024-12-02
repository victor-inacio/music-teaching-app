//
//  Slideshow.swift
//  music-sheet-app
//
//  Created by Victor Soares on 23/05/23.
//

import SwiftUI


struct Slideshow: View {
    
    let views: [AnyView]
    @State var currentIndex = 0
    @EnvironmentObject var lesson: Lesson
    @State var offset: CGFloat = 0.0
    @State var opacity: Double = 1
    @State var canTranslate = false
    @State var canMakeTransition = false
    let animationDuration = 0.2
    let offsetLimit: CGFloat = 80
    var onSlideChange: (() -> Void)?
    var onSlidesEnd: (() -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            views[currentIndex]
                .background(.white)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .opacity(opacity)
                .animation(.easeInOut(duration: animationDuration), value: opacity)
                .offset(x: offset, y: 0)
                .animation(.easeInOut(duration: animationDuration), value: offset)
        }
        .onChange(of: canMakeTransition, perform: { newValue in
            
            if canMakeTransition {
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    offset = 0
                    opacity = 1
                }
                
                canMakeTransition = false
            }
        })
        .gesture(DragGesture()
            .onChanged { event in
                offset = event.translation.width
                offset = max(offset, -(offsetLimit))
                offset = min(offset, offsetLimit)
                
                if offset > 0 && !canDecrease() {
                    return
                }
                
                if offset < 0 && !canIncrease() {
                    return
                }
                
                canTranslate = +(abs(offset)) >= offsetLimit
            }
            .onEnded({ value in
                if (canTranslate) {
                    offset = 300 * (offset > 0 ? 1 : -1)
                    opacity = 0
                    canTranslate = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        if (offset < 0) {
                            nextSlide()
                        } else {
                            previousSlide()
                        }
                        
                        offset = offset > 0 ? -(offsetLimit) : offsetLimit
                        
                        
                        canMakeTransition = true
                    }
                } else {
                    offset = 0
                }
                    
//                if (value.startLocation.x > value.location.x) {
//                    nextSlide()
//                } else {
//                    previousSlide()
//                }
            }))
    }

    
    func canIncrease() -> Bool {
        return currentIndex + 1 < views.count
    }
    
    func canDecrease() -> Bool {
        return currentIndex - 1 > -1
    }
    
    func previousSlide() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func nextSlide() {
        if currentIndex + 1 != views.count {
            currentIndex += 1
            if let onSlideChange = onSlideChange {
                onSlideChange()
            }
            let percentage = 100 * currentIndex / views.count
            
            if lesson.percentage < percentage {
                lesson.percentage = percentage
            }
        } else {
                    }
    }
}

//struct Slideshow_Previews: PreviewProvider {
//    static var previews: some View {
//        Slideshow(views: [
//            AnyView(Lesson1_Slide1()),
//            AnyView(Lesson1_Slide2()),
//            AnyView(Lesson1_Slide3()),
//            AnyView(Lesson1_Slide4()),
//            AnyView(Lesson1_Slide5())
//        ])
//    }
//}
