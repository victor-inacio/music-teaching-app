//
//  QuadButton.swift
//  music-sheet-app
//
//  Created by Victor Soares on 15/05/23.
//

import SwiftUI


struct QuadButton: View {
    
    enum Variants {
        case normal
        case danger
    }
    
    var text: String
    var Icon: Image?
    var disabled = false
    var variant: Variants = .normal
    
    var body: some View {
        VStack {
            if Icon != nil {
                Icon
                    .font(.system(size: 24))
                    .padding(.bottom, 7)
            }
            Text(text)
                .font(.system(size: 16))
        }
        .frame(width: 129, height: 78)
        .background(disabled ? Color("gray") : getBackgroundColor())
        .foregroundColor(disabled ? Color("gray-light") : getForegroundColor())
        .cornerRadius(3)
        .shadow(radius: 4)
    }
    
    func getBackgroundColor() -> Color {
        switch(variant) {
        case .normal :
            return Color("primary")
        case .danger:
            return Color("danger")
        }
    }
    
    func getForegroundColor() -> Color {
        switch(variant) {
        case .normal :
            return Color("primary-light")
        case .danger:
            return Color("danger-light")
        }
    }
}

struct QuadButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            QuadButton(text: "Teste", Icon: Image(systemName: "pencil.and.outline"))
            QuadButton(text: "Teste", Icon: Image(systemName: "pencil.and.outline"), disabled: true)
            QuadButton(text: "Teste", Icon: Image(systemName: "pencil.and.outline"), variant: .danger)
            
        }
    }
}
