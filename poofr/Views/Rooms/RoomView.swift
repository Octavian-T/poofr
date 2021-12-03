//
//  RoomView.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct RoomView: View {
    // Room
    @State private var isShowing = true
    @State var selected: Int = 0
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        VStack {
            if !isShowing {
                RoomViewTopBar()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 5){
                        ForEach(1..<20) { no in
                            SmallProfile(number: no)
                                .onTapGesture {
                                    self.selected = no
                                    isShowing.toggle()
                                }
                        }
                    }
                }
            }else{
                BigProfile(isShowing: $isShowing)
            }
        }
        .padding(EdgeInsets(top: 45, leading: 0, bottom: 85, trailing: 0))
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .edgesIgnoringSafeArea(.all)
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
