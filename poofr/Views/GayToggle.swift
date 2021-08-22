//
//  GayToggle.swift
//  poofr
//
//  Created by Octavian Tabacaru on 13/08/2021.
//

import SwiftUI

struct GayToggle: View {
    @State private var position = true
    @State private var animAmntBtm = CGSize.zero
    @State private var animAmntTop = CGSize.zero
    @State private var isOn = 1.0
    //@State private var position: Bool = position
    var body: some View {
        HStack {
            if position {
                Text("top")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(4)
                    .background(Color(red: 190/255, green: 45/255, blue: 20/255)) // assign system color top
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .offset(x: animAmntTop.width)
                    .gesture(
                        DragGesture()
                            .onChanged({
                                self.isOn = 0.0
                                if $0.translation.width > 0 && $0.translation.width < 37{
                                    self.animAmntTop.width = $0.translation.width
                                }
                            })
                            .onEnded ({ _ in
                                    self.animAmntTop = .zero
                                    self.animAmntBtm = .zero
                                    self.isOn = 1.0
                                    self.position = false
                            })
                    )
                Text("for")
                    .foregroundColor(.black)
                    .opacity(self.isOn)
                Text("bottom")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(4)
                    .background(Color(red: 150/255, green: 120/255, blue: 1)) // assign system color bottom
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }else{
                Text("bottom")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(4)
                    .background(Color(red: 150/255, green: 120/255, blue: 1)) // assign system color bottom
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .offset(x: animAmntTop.width)
                    .gesture(
                        DragGesture()
                            .onChanged({
                                self.isOn = 0.0
                                if $0.translation.width > 0 && $0.translation.width < 38{
                                    self.animAmntTop.width = $0.translation.width
                                }
                            })
                            .onEnded ({ _ in
                                
                                    self.animAmntTop = .zero
                                    self.animAmntBtm = .zero
                                    self.isOn = 1.0
                                    self.position = true
                                
                            })
                    )
                    
                Text("for")
                    .foregroundColor(.black)
                    .opacity(self.isOn)
                Text("top")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(4)
                    .background(Color(red: 190/255, green: 45/255, blue: 20/255)) // assign system color top
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct GayToggle_Previews: PreviewProvider {
    static var previews: some View {
        GayToggle()
    }
}
