//
//  SmallProfile.swift
//  poofr
//
//  Created by Octavian Tabacaru on 20/09/2021.
//

import SwiftUI

struct SmallProfile: View {
    var number: Int
    var body: some View{
        ZStack {
            VStack(alignment: .center, spacing: -20) {
                ZStack(alignment: .topLeading) {
                    image("patrick")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 0.8))
                    HStack {
                        CapDesc(desc: "1")
                        Spacer()
                        CapDesc(desc: "5")
                    }
                    .padding(5)
                }
                .zIndex(0)
                VStack(alignment: .leading, spacing:5) {
                    Text("\(number)")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(4)
                }
                .zIndex(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(Color(red: 150/255, green: 120/255, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(Color.black, lineWidth: 0.8))
                        .opacity(0.90)
            }
            .padding(5)
            .shadow(radius: 10).accentColor(.white)
        }//zstack
    }//body
}//struct

struct SmallProfile_Previews: PreviewProvider {
    @Namespace static var maxAnimation
    static var previews: some View {
        SmallProfile(number:1)
    }
}
