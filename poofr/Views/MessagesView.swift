//
//  MessagesView.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct MessagesView: View {
    //@State private var animAmnt = [CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, , CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero]
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
    var arr = ["Hello", "Hi", "Sup", "Hii", "hello"]
    var body: some View {
        VStack {
            MessagesViewTop(position: true)
                .frame(height:85)
            ScrollView{
                VStack(spacing: 0) {
                    ForEach(0 ..< 50) { number in
                        HStack(spacing: 10) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)/*
                                .offset(x: animAmnt[number].width)
                                .gesture(
                                    DragGesture()
                                        .onChanged({
                                            withAnimation(.spring()) {
                                                self.animAmnt[number].width = $0.translation.width
                                            }
                                        })
                                        .onEnded({ _ in
                                            withAnimation(.spring()){
                                                self.animAmnt[number].width = .zero
                                            }
                                        })
                                )
                                .animation(.spring())
                             */
                            Text("so how are you doing do you want to fuck?\(number)")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight:90)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(5)
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.1, blue: 0.1, opacity: 1), Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1)]), startPoint: .leading, endPoint: .trailing))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
