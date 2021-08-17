//
//  GayToggle.swift
//  poofr
//
//  Created by Octavian Tabacaru on 13/08/2021.
//

import SwiftUI

struct GayToggle: View {
    @State private var animAmnt = CGFloat.zero
    struct TopCap: View {
        var body: some View {
            Text("top")
                .foregroundColor(.white)
                .font(.title)
                .padding(4)
                .background(Color(red: 190/255, green: 45/255, blue: 20/255)) // assign system color top
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(self.animAmnt/*.height*/)
                .gesture(
                    DragGesture({
                        .onChanged({
                            self.animAmnt = $0.translation/*.height*/
                        })
                        .onEnd({
                            withAnimation(.spring()) {
                                self.animAmnt = .zero
                            }
                        })
                })
                .animation(.spring())
        }
    }
    struct BottomCap: View {
        var body: some View {
            Text("bottom")
                .foregroundColor(.white)
                .font(.title)
                .padding(4)
                .background(Color(red: 150/255, green: 120/255, blue: 1)) // assign system color bottom
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
    var position: Bool
    @State private var isOn = false
    var body: some View {
        HStack {
            if position {
                TopCap()
            }else{
                BottomCap()
            }
            Text("for")
                .foregroundColor(.black)
            if position {
                BottomCap()
            }else{
                TopCap()
            }
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct GayToggle_Previews: PreviewProvider {
    static var previews: some View {
        GayToggle(position: true)
    }
}
