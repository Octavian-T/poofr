//
//  ExternalProfileBig.swift
//  poofr
//
//  Created by Octavian Tabacaru on 21/08/2021.
//

import SwiftUI

//
//  ExternalProfileSmall.swift
//  poofr
//
//  Created by Octavian Tabacaru on 12/08/2021.
//

import SwiftUI

struct ExternalProfileBig: View {
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
                        CapDesc(desc: capDesc[0])
                        Spacer()
                        CapDesc(desc: capDesc[1])
                    }
                    .padding(5)
                }
                VStack(alignment: .leading) {
                    Text("Fuck yea")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(4)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.black, lineWidth: 0.8))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(Color.black, lineWidth: 0.8))
                .opacity(0.8)
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
                        
                    }, label: {
                        Image(systemName: "message")
                            .padding(3)
                            .background(Color.red)
                            .clipShape(Circle())
                            .scaleEffect(2)
                    })
                }
                .padding()
            }//vstack
        }//scrollview
        .padding(10)
        .shadow(radius: 50).accentColor(.white)
        .background((LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.1, opacity: 1), Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1)]), startPoint: .leading, endPoint: .trailing)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExternalProfileBig_Previews: PreviewProvider {
    static var previews: some View {
        ExternalProfileBig(title:"super duper sexy time", libido: true, imageLoc: "patrick", capDesc: ["3", "5"])
    }
}
