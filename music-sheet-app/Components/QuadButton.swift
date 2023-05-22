//
//  QuadButton.swift
//  music-sheet-app
//
//  Created by Victor Soares on 15/05/23.
//

import SwiftUI

struct QuadButton: View {
    
    var text: String
    var Icon: Image
    
    var body: some View {
        VStack {
            Icon
                .font(.system(size: 24))
                .padding(.bottom, 7)
                .foregroundColor(Color("primary-light"))
            Text(text)
                .font(.system(size: 16))
        }
        .frame(width: 129, height: 78)
        .background(Color("primary"))
        .foregroundColor(Color("white"))
        .cornerRadius(3)
        .shadow(radius: 4)
    }
}

struct QuadButton_Previews: PreviewProvider {
    static var previews: some View {
        QuadButton(text: "Teste", Icon: Image(systemName: "pencil.and.outline"))
    }
}
