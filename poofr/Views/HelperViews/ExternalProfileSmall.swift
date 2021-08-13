//
//  ExternalProfileSmall.swift
//  poofr
//
//  Created by Octavian Tabacaru on 12/08/2021.
//

import SwiftUI

struct CapDesc: View {
    var desc: String
    var body: some View {
        Text(desc)
            .foregroundColor(.white)
            .padding(4)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
struct ExternalProfileSmall: View {
    var title: String
    var libido: Bool
    var imageLoc: String
    var image: Image {
        let sourceImage = UIImage(
            named: imageLoc
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
    var capDesc: Array<String>
    var body: some View {
        VStack(alignment: .center, spacing: -20) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black, lineWidth: 0.8))
            VStack(alignment: .leading, spacing:5) {
                Text("Fuck yea")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(4)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black, lineWidth: 0.8))
                HStack {
                    CapDesc(desc: capDesc[0])
                    CapDesc(desc: capDesc[1])
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color.black, lineWidth: 0.8))
            .opacity(0.90)
        }
        .padding(5)
        .shadow(radius: 50).accentColor(.white)
    }
}


struct ExternalProfileSmall_Previews: PreviewProvider {
    static var previews: some View {
        ExternalProfileSmall(title:"super duper sexy time", libido: true, imageLoc: "patrick", capDesc: ["safe", "kink"])
            .frame(width: 250, height: 350)
    }
}
