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
            HStack(alignment: .center) {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color(red: 150/255, green: 120/255, blue: 1))
                        .frame(width: position ? 110 : 100, height: 8)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .offset(x: position ? animAmtBox.width-75 : animAmtBox.width+83, y:21)
                        .animation(.spring())
                    HStack(spacing: 3) {
                        Text("messages")
                            .foregroundColor(.white)
                            .font(.title)
                            .onTapGesture {
                                position = true
                            }
                        Text("|")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                        Text("requests")
                            .foregroundColor(.white)
                            .font(.title)
                            .onTapGesture {
                                position = false
                            }
                    }
                    .frame(width:300, height: 45)
                    .padding(2)
                    .animation(.spring())
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 15, trailing: 20))
        }
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .frame(height: 45)
        .padding(.top, 55)
    }
}
/*
 
 */

struct MessagesViewTop_Previews: PreviewProvider {
    static var previews: some View {
        MessagesViewTop()
            .frame(height:85)
    }
}
