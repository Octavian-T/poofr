//
//  MessagesView.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct MessagesView: View {
    @State private var animAmntOpa = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ]
    @State private var animAmnt = [CGSize(width: 0.0, height: 0.0), CGSize(width: 0.0, height: 0.0), CGSize(width: 0.0, height: 0.0), CGSize(width: 0.0, height: 0.0), CGSize(width: 0.0, height: 0.0), CGSize(width: 0.0, height: 0.0)]
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
        VStack(spacing:10) {
            MessagesViewTop()
                .frame(height:55)
                .padding(.top, 30)
            ScrollView{
                VStack(spacing: 0) {
                    ForEach(0 ..< 5) { number in
                        HStack(spacing: 10) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                                .offset(x: animAmnt[number].width)
                                .gesture(
                                    DragGesture()
                                        .onChanged({
                                            if $0.translation.width > 10 && $0.translation.width < 40 {
                                                self.animAmntOpa[number] = 0.8
                                            }else if $0.translation.width > 40 && $0.translation.width < 80 {
                                                self.animAmntOpa[number] = 0.4
                                            }else if $0.translation.width > 80 && $0.translation.width < 160 {
                                                self.animAmntOpa[number] = 0.2
                                            }else if $0.translation.width > 160 && $0.translation.width < 200 {
                                                self.animAmntOpa[number] = 0.05
                                            }
                                            self.animAmnt[number].width = $0.translation.width
                                        })
                                        .onEnded({ _ in
                                            withAnimation(.spring()){
                                                self.animAmntOpa[number] = 1.0
                                                self.animAmnt[number].width = .zero
                                            }
                                        })
                                )
                                .animation(.spring())
                            Text("so how are you doing do you want to fuck?\(number)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .opacity(animAmntOpa[number])
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
        .edgesIgnoringSafeArea(.all)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
