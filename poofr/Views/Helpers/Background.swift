//
//  Background.swift
//  poofr
//
//  Created by Otty on 14/10/2021.
//

import SwiftUI

struct Square: InsettableShape {
    var insetAmount: CGFloat = 0
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
    func inset(by amount: CGFloat) -> some InsettableShape {
        var square = self
        square.insetAmount += amount
        return square
    }
}
struct Arc: InsettableShape {
    var startAng: Angle
    var endAng: Angle
    var insetAmount: CGFloat = 0
    func path(in rect: CGRect) -> Path {
        let startAng = startAng - .degrees(90)
        let endAng = endAng - .degrees(90)
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: startAng, endAngle: endAng, clockwise: false)
        return path
    }
    func inset(by amount: CGFloat)  -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Thing: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var petalOffset: Double = -20
        // How wide to make each petal
        var petalWidth: Double = 100
        for number in stride(from: 0, through: CGFloat.pi*2, by: CGFloat.pi/8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        return path
    }
}

struct TextThing: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image(systemName: "star.fill"), scale: 1), width: 30)
    }
}

struct ColorCircle: View {
    var steps = 150
    var amount = 1.6
    var body: some View{
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Blend: View {
    var body: some View {
        ZStack {
            Image("patrick")
                .blur(radius: 2.0)
                .saturation(5.0)
            Rectangle()
                .fill(Color.pink)
                .blendMode(.screen)
        }
        .frame(width: 400, height: 400)
        .clipped()
    }
}

struct Circles: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack(spacing:0) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 1, green: 0, blue: 0))
                            .frame(width: 200 * amount)
                            .offset(x: -50, y: -80)
                            .blendMode(.screen)

                        Circle()
                            .fill(Color(red: 0, green: 1, blue: 0))
                            .frame(width: 200 * amount)
                            .offset(x: 50, y: -80)
                            .blendMode(.screen)

                        Circle()
                            .fill(Color(red: 0, green: 0, blue: 1))
                            .frame(width: 200 * amount)
                            .blendMode(.screen)
                    }
                    .frame(width: 300, height: 300)

                    Slider(value: $amount)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        /*
            VStack(spacing:20) {
                Square()
                    .strokeBorder(Color.blue, lineWidth: 10)
                    .frame(width: 100, height: 100)

                Arc(startAng: .degrees(-40), endAng: .degrees(120))
                    .strokeBorder(.blue, lineWidth: 30)
                    .frame(width: 150, height: 150)

                Arc(startAng: .degrees(-120), endAng: .degrees(75))
                    .strokeBorder(.blue, lineWidth: 30)
                    .frame(width: 120, height: 120)

                Thing()
                    .fill(Color.red, style: FillStyle(eoFill: true))
                    .frame(width: 50, height: 50)

                TextThing()
            }
            .background(Color.black)
         */
            VStack {
                //ColorCircle()
                Blend()
                //Circles()
            }
    }
}
