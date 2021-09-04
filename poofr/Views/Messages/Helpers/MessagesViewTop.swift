//
//  MessagesViewTop.swift
//  poofr
//
//  Created by Octavian Tabacaru on 18/08/2021.
//

import SwiftUI

struct MessagesViewTop: View {
    @State private var position = true
    @State private var animAmntBtm = CGSize.zero
    @State private var animAmtBox = CGSize.zero
    @State private var isOn = 1.0
    //@State private var position: Bool = position
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: position ? 118 : 100, height: 39)
                //.background(Color(red: 190/255, green: 45/255, blue: 20/255))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(x: position ? animAmtBox.width-54 : animAmtBox.width+63)
                .animation(.spring())
            HStack(spacing: 3) {
                Text("messages")
                    .foregroundColor(.white)
                    .font(.title)
                Text("|")
                    .font(.title)
                    .foregroundColor(.white)
                Text("requests")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width:300, height: 45)
            .padding(2)
            
            .onTapGesture {
                position.toggle()
            }
            .animation(.spring())
        }
        .frame(minWidth: 240, maxWidth: 240)
        .padding(3)
        .background(Color(red: 150/255, green: 120/255, blue: 1))
        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 3.0))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}


struct MessagesViewTop_Previews: PreviewProvider {
    static var previews: some View {
        MessagesViewTop()
            .frame(height:85)
    }
}
