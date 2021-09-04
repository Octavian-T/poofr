//
//  RoomViewTopBar.swift
//  poofr
//
//  Created by Octavian Tabacaru on 12/08/2021.
//

import SwiftUI
struct RoomViewTopBar: View {
    var position: Bool
    var btnColor: Array<Double> {
        if position {
            return [150/255, 120/255, 1] // bottom color
        }else{
            return [190/255, 45/255, 20/255] // top color
        }
    }
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                GayToggle()
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "building.fill")
                        .foregroundColor(.white)
                        .padding(2)
                        .font(.largeTitle)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 2))
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))
        }
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
    }
}


struct RoomViewTopBar_Previews: PreviewProvider {
    static var previews: some View {
        RoomViewTopBar(position: false)
            .frame(height: 10)
    }
}
