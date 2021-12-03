//
//  image.swift
//  poofr
//
//  Created by Octavian Tabacaru on 20/09/2021.
//

import SwiftUI
func image(_ loc:String)->Image {
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
