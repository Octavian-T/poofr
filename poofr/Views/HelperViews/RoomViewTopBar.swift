//
//  RoomViewTopBar.swift
//  poofr
//
//  Created by Octavian Tabacaru on 12/08/2021.
//

import SwiftUI
struct RoomViewTopBar: View {
    struct TopCap: View {
        var body: some View {
            Text("top")
                .foregroundColor(.white)
                .font(.title)
                .padding(4)
                .background(Color(red: 190/255, green: 45/255, blue: 20/255)) // assign system color top
                .clipShape(RoundedRectangle(cornerRadius: 5))
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
    var btnColor: Array<Double> {
        if position {
            return [150/255, 120/255, 1] // bottom color
        }else{
            return [190/255, 45/255, 20/255] // top color
        }
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.1, opacity: 1), Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1)]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            HStack(alignment: .center) {
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
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "building.fill")
                        .foregroundColor(.white)
                        .padding(2)
                        .font(.title)
                        .background(Color(red: btnColor[0], green: btnColor[1], blue: btnColor[2]))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))
        }
    }
}


struct RoomViewTopBar_Previews: PreviewProvider {
    static var previews: some View {
        RoomViewTopBar(position: false)
            .frame(height: 10)
    }
}
