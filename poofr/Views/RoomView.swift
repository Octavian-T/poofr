//
//  RoomView.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct RoomView: View {
    var libidos = [true, false , true, false, true, true, false, false, false, true, false, true, false, true, true , true, false, true, false, false, false, false, true, false, true, false, true, true, false, true]
    var images = ["patrick", "Spongebobwithglasses", "sandy", "Spongebobwithglasses", "sandy", "patrick", "patrick", "Spongebobwithglasses", "sandy", "Spongebobwithglasses", "sandy", "patrick", "patrick", "Spongebobwithglasses", "sandy", "Spongebobwithglasses", "sandy", "patrick", "patrick", "Spongebobwithglasses", "sandy", "Spongebobwithglasses", "sandy", "patrick", "patrick", "Spongebobwithglasses", "sandy", "Spongebobwithglasses", "sandy", "patrick"]
    var body: some View {
        VStack(spacing:0) {
            RoomViewTopBar(position: true)
                .frame(height: 85)
            ScrollView {
                VStack(spacing:5) {
                    ForEach(0 ..< 15) { number1 in
                        HStack(spacing:5) {
                            ExternalProfileSmall(title: "super duper extra", libido: libidos[number1], imageLoc: images[number1], capDesc: ["2", "4"])
                            ExternalProfileSmall(title: "sex", libido: libidos[number1+1], imageLoc: images[number1+1], capDesc: ["2", "4"])
                        }
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.1, opacity: 1), Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1)]), startPoint: .leading, endPoint: .trailing))
    } //body
} //struct

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
