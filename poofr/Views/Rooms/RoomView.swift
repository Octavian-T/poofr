//
//  RoomView.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct RoomView: View {
    // Room
    @State private var isShowing = false
    @Namespace private var animation
    // Profile
    struct CapDesc: View {
        var desc: String
        var body: some View {
            Text(desc)
                .font(.headline)
                .foregroundColor(.black)
                .padding(5)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(RoundedRectangle(cornerRadius: 30).strokeBorder(Color.black, lineWidth: 0.8))
        }
    }
    var image: Image {
        let sourceImage = UIImage(
            named: "patrick"
        )!
        // The shortest side
        let sideLength = min(
            sourceImage.size.width,
            sourceImage.size.height
        )
        // Determines the x,y coordinate of a centered
        // sideLength by sideLength square
        let sourceSize = sourceImage.size
        let xOffset = (sourceSize.width - sideLength) / 2.0
        let yOffset = (sourceSize.height - sideLength) / 2.0
        // The cropRect is the rect of the image to keep,
        // in this case centered
        let cropRect = CGRect(
            x: xOffset,
            y: yOffset,
            width: sideLength,
            height: sideLength
        ).integral
        // Center crop the image
        let sourceCGImage = sourceImage.cgImage!
        let croppedCGImage = sourceCGImage.cropping(
            to: cropRect
        )!
        return Image(uiImage: UIImage(cgImage: croppedCGImage))
    }


    var body: some View {
        VStack {


            if !isShowing {
                //withAnimation(.spring()){
                    RoomViewTopBar(position: true)
                        .frame(height: 35)
                        .padding(.top, 30)
                        //.animation(.spring())
                //}
            }
            if !isShowing {


                    ScrollView {
                        VStack(spacing:5) {
                            //ForEach(0 ..< 15) { number1 in
                                HStack(spacing:5) {


                                    VStack(alignment: .center, spacing: -20) {
                                        ZStack(alignment: .topLeading) {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(Color.black, lineWidth: 0.8))
                                                .matchedGeometryEffect(id: "image", in: animation)
                                            HStack {
                                                CapDesc(desc: "1")
                                                    .matchedGeometryEffect(id: "capDesc1", in: animation)
                                                Spacer()
                                                CapDesc(desc: "5")
                                                    .matchedGeometryEffect(id: "capDesc2", in: animation)
                                            }
                                            .padding(5)
                                        }
                                        VStack(alignment: .leading, spacing:5) {
                                                Text("Patrick")
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                    .padding(4)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(10)
                                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .strokeBorder(Color.black, lineWidth: 0.8))
                                        .opacity(0.90)
                                        .matchedGeometryEffect(id: "title", in: animation)
                                    }
                                    .padding(5)
                                    .shadow(radius: 50).accentColor(.white)
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            isShowing.toggle()
                                        }
                                    }


                                }
                            //}
                        }
                    }


            }else{
                ScrollView {
                    VStack(alignment: .trailing, spacing: -5) {
                        ZStack(alignment: .topLeading) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color.black, lineWidth: 0.8))
                            HStack {
                                CapDesc(desc: "1")
                                Spacer()
                                CapDesc(desc: "2")
                            }
                            .padding(5)
                        }
                        .matchedGeometryEffect(id: "image", in: animation)
                        VStack(alignment: .leading, spacing:5) {
                                Text("Patrick")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(4)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background(Color(red: 150/255, green: 120/255, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .strokeBorder(Color.black, lineWidth: 0.8))
                        .opacity(0.90)
                        .matchedGeometryEffect(id: "title", in: animation)
                        if isShowing {
                            VStack(alignment: .leading) {
                                HStack(spacing:50) {
                                    HStack {
                                        Text("Height")
                                        Text("5'7")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(4)
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .strokeBorder(Color.black, lineWidth: 0.8))
                                    }
                                    HStack {
                                        Text("Age")
                                        Text("20")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(4)
                                            .background(Color.red)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .strokeBorder(Color.black, lineWidth: 0.8))
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(Color.black, lineWidth: 0.8))
                            .opacity(0.8)
                            VStack(alignment: .leading, spacing:50) {
                                VStack(alignment: .center) {
                                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(Color.black, lineWidth: 0.8))
                            .opacity(0.8)
                            HStack(spacing: 30) {
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "eye.slash.fill")
                                        .padding(3)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .scaleEffect(2)
                                })
                                Button(action: {
                                    withAnimation(.spring()){
                                        isShowing.toggle()
                                    }
                                }, label: {
                                    Image(systemName: "message")
                                        .padding(3)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .scaleEffect(2)
                                })
                            }
                            .padding()
                            .animation(.spring())
                        }
                    }//vstack
                }//scrollview
                .padding(10)
                .shadow(radius: 50).accentColor(.white)
                //.background((LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.1, opacity: 1), Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1)]), startPoint: .leading, endPoint: .trailing)))
                .edgesIgnoringSafeArea(.all)
            }
        }
    } //body
} //struct

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
            .edgesIgnoringSafeArea(.all)
    }
}
