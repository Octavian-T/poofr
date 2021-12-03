//
//  RoomViewTopBar.swift
//  poofr
//
//  Created by Octavian Tabacaru on 12/08/2021.
//

import SwiftUI
struct RoomViewTopBar: View {
    @State private var animPos = CGSize.zero
    @State private var toggle = false
    var btnColor: Array<Double> {
        if self.toggle {
            return [150/255, 120/255, 1] // bottom color
        }else{
            return [190/255, 45/255, 20/255] // top color
        }
    }
    var body: some View {
        ZStack {
            Color(red: 0.15, green: 0.15, blue: 0.15)
            HStack(alignment: .center) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 150/255, green: 120/255, blue: 1))
                        .frame(width: toggle ? 40 : 83, height: 5)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .offset(x: toggle ? animPos.width-56 : animPos.width+32, y:+20)
                        .animation(.spring())
                    HStack(spacing: 3) {
                        Text("top")
                            .foregroundColor(.white)
                            .font(.title)
                            .onTapGesture {
                                self.toggle = true
                            }
                        Text("|")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(7)
                        Text("bottom")
                            .foregroundColor(.white)
                            .font(.title)
                            .onTapGesture {
                                self.toggle = false
                            }
                    }
                    .frame(width:160, height: 45)
                    .padding(2)
                }
                .frame(minWidth: 150, maxWidth: 150)
                .padding(3)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "camera.filters")
                        .foregroundColor(Color(red: 150/255, green: 120/255, blue: 1))
                        .padding(2)
                        .font(.largeTitle)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        .frame(height: 70)
    }
}


struct RoomViewTopBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomViewTopBar()
        }
    }
}
