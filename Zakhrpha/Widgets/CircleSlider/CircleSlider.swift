//
//  CircleSlider.swift
//  RealThermometer
//
//  Created by miqo on 12.12.23.
//

import SwiftUI

struct CircleSlider: View {
    struct Config {
        let minimumValue: CGFloat
        let maximumValue: CGFloat
        let totalValue: CGFloat
        let knobRadius: CGFloat
        let radius: CGFloat
    }
    
    @State var temperatureValue: CGFloat = 0
    @State var angleValue: CGFloat = 0
    
    let config = Config(minimumValue: 32.0,
                        maximumValue: 45.0,
                        totalValue: 40.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    var body: some View {
        ZStack {
            
            Circle()
                .trim(from: 0, to: 0.25 + 0.25 + 0.25/2)
                .rotation(.degrees(-90-90-45/2))
                .stroke(style: .init(lineWidth: 10, lineCap: .round, lineJoin: .miter))
                .fill(.gray.opacity(0.5))
                .frame(width: config.radius * 2, height: config.radius * 2)
            
            Circle()
                .trim(from: 0, to: (0.25 + 0.25 + 0.25/2)*(temperatureValue-config.minimumValue)/(config.maximumValue-config.minimumValue))
                .rotation(.degrees(-90-90-45/2))
                .stroke(style: .init(lineWidth: 20, lineCap: .round, lineJoin: .miter))
                .fill(.green)
                .frame(width: config.radius * 2, height: config.radius * 2)
            
            Circle()
                .fill(.white)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .padding(10)
                .offset(y: config.radius)
                .rotationEffect(Angle.degrees(45 + 45/2 + Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        print("angle", angleValue)

                        change(location: value.location)
                    }))
        }
    }
    
    private func change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)
        let radian = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + 220 * (.pi / 180.0)

        let angle = radian * (180.0 / .pi)
        
        print("angle", angle)
        
        if 0 <= angle && angle <= 220 {
            angleValue = angle
            temperatureValue = angleValue/220 * (config.maximumValue - config.minimumValue) + config.minimumValue
        }
    }
}

#Preview {
    ZStack {
        
        //Color(hex: "F7F8F8")
        Color.black
            .ignoresSafeArea()
        
        CircleSlider()
    }
}
