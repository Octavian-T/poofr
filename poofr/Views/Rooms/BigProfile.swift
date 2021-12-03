//
//  BigProfile.swift
//  poofr
//
//  Created by Otty on 04/10/2021.
//

import SwiftUI

struct BigProfile: View {
    @Binding var isShowing: Bool
    var desc = "Hello there how are you? I like to eat scared little bithches, prefably while they are still alive! :)"
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            VStack(alignment:.center, spacing:1) {
                HStack(spacing: 0) {
                    VStack(alignment: .center, spacing:5) {
                        Text("Patrick")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(4)
                    }
                    .frame(maxWidth: 260, maxHeight: 80, alignment: .center)
                    .background(Color(red: 150/255, green: 120/255, blue: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black, lineWidth: 0.8))
                    .opacity(0.90)
                    .onTapGesture {
                        self.isShowing = false
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                ScrollView(.horizontal){
                    HStack {
                        ZStack {
                            image("patrick")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color.black, lineWidth: 0.8))
                        }
                        ZStack {
                            image("patrick")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color.black, lineWidth: 0.8))
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                VStack(spacing:3) {
                    HStack(spacing:5) {
                        VStack {
                            Group {
                                Text("Height")
                                    .foregroundColor(.black)
                                    .font(.body)
                                Text("5\"8")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                        }
                        .frame(maxWidth: 60, maxHeight: 80)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 0.8))
                        VStack {
                            Group {
                                Text("Age")
                                    .foregroundColor(.black)
                                    .font(.body)
                                Text("21")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                        }
                        .frame(maxWidth: 60, maxHeight: 80)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 0.8))
                        VStack {
                            Text("Libi")
                                .font(.body)
                                .foregroundColor(.black)
                            Text("1")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .frame(width: 60)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black, lineWidth: 0.8))
                        VStack {
                            Text("Prom")
                                .font(.body)
                                .foregroundColor(.black)
                            Text("5")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .frame(width: 60)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black, lineWidth: 0.8))
                    }
                    .zIndex(1)
                }
                .padding(5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black, lineWidth: 0.8))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                VStack {
                    Text(desc)
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(5)
                        .frame(maxWidth: .infinity, maxHeight: 700)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.black, lineWidth: 0.8))
                        .opacity(0.8)
                }
                .padding(5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black, lineWidth: 0.8))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
            VStack(alignment: .trailing){
                Image(systemName: "xmark")
                    .foregroundColor(Color(red: 150/255, green: 120/255, blue: 1))
                    .scaleEffect(5)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black, lineWidth: 0.8))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 15))
        }
    }//body
}//struct

/*
struct BigProfile_Previews: PreviewProvider {
    static var previews: some View {
        BigProfile(isShowing: $isShowing)
    }
}
*/
