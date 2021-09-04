//
//  GayToggle.swift
//  poofr
//
//  Created by Octavian Tabacaru on 13/08/2021.
//

import SwiftUI

struct GayToggle: View {
    @State private var position = false
    @State private var animPos = CGSize.zero
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: position ? 42 : 86, height: 39)
                .background(Color(red: 190/255, green: 45/255, blue: 20/255))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(x: position ? animPos.width-47 : animPos.width+25)
                .animation(.spring())
            HStack(spacing: 3) {
                Text("top")
                    .foregroundColor(.white)
                    .font(.title)
                Text("|")
                    .font(.title)
                    .foregroundColor(.white)
                Text("bottom")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width:160, height: 45)
            .padding(2)
            .onTapGesture {
                position.toggle()
            }
            .animation(.spring())
        }
        .frame(minWidth: 150, maxWidth: 150)
        .padding(3)
        .background(Color(red: 150/255, green: 120/255, blue: 1))
        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 3.0))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct GayToggle_Previews: PreviewProvider {
    static var previews: some View {
        GayToggle()
    }
}
