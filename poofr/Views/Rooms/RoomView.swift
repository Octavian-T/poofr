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
            named: "Patrick"
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
        if !isShowing {
            VStack(spacing:20) {
                RoomViewTopBar(position: true)
                    .frame(height: 35)
                    .padding(.top, 30)
                ScrollView {
                    VStack(spacing:5) {
                        ForEach(0 ..< 15) { number1 in
                            HStack(spacing:5) {
                                
                            }
                        }
                    }
                }
            }
            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
            .edgesIgnoringSafeArea(.all)
        }else{
            ExternalProfileBig(title:"hi", libido:true, imageLoc:"patrick", capDesc: ["12", "1"])
                .matchedGeometryEffect(id: "profile", in: animation)
        }
    } //body
} //struct

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
